const mongoose = require('mongoose');
const assert = require('assert');
const User = require('../src/user');
const Comment = require('../src/comment');
const BlogPost = require('../src/blogPost');

describe('Associations', () => {
  let joe, blogPost, comment;
  
  beforeEach((done) => {
    joe = new User({ name: 'Joe' });
    blogPost = new BlogPost({ title: 'JS is great', content: 'Yep it really is' });
    comment = new Comment({ content: 'Congrats on great post' });
    // at this point they are not associated at all !!!

    joe.blogPosts.push(blogPost);  // pushing new blog (entire model) into blogPost array(expects ObjectId)
    blogPost.comments.push(comment); // push new comment (entire model) into comments array(expects ObjectId)
    comment.user = joe; // mongoose will help => trying to assign whole model, but mongoose takes only ObjectId
    // at this point they are associated, but only exist in the memory in node (webserver)

    // joe.save();
    // blogPost.save();
    // comment.save();
 
    // will combine all 3 promises to one
    Promise.all([joe.save(), blogPost.save(), comment.save()])
      .then(() => done());
  });

  it('saves a relation between a user and a blopost', (done) => {
    User.findOne({ name: 'Joe' })
      .populate('blogPosts') // modifier => same name blogPosts as in user model
      .then((user) => {
        assert(user.blogPosts[0].title === 'JS is great');
        done();
      });
  });

  it('saves full relation graph', (done) => {
    User.findOne({ name: 'Joe' })
      .populate({ // populate can also take object as arg
        path: 'blogPosts', // inside of the user we fetch, we want to recursively load this resource       
        populate: { // inside of the path, we want to go further and load additional resource
          path: 'comments', // name of the property in blogPost schema
          model: 'comment',  // name of the ref in property comments in blogPost schema
          populate: { // inside comments path load another resource (user)
            path: 'user',
            model: 'user'

          }
        }  
      })
      .then((user) => {
        assert(user.name === 'Joe');
        assert(user.blogPosts[0].title === 'JS is great');
        assert(user.blogPosts[0].comments[0].content === 'Congrats on great post');
        assert(user.blogPosts[0].comments[0].user.name === 'Joe');

        done();
      });
  });

});