const mongoose = require('mongoose');
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

  it.only('saves a relation between a user and a blopost', (done) => {
    User.findOne({ name: 'Joe' })
      .then((user) => {
        console.log(user);
        done();
      });
  });


});