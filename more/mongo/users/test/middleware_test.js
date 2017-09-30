const mongoose = require('mongoose');
const assert = require('assert');
const User = require('../src/user');
const BlogPost = require('../src/blogPost');

describe('Middleware', () => {
  let joe, blogPost;

  // coppied before each from association_test
  beforeEach((done) => {
    joe = new User({ name: 'Joe' });
    blogPost = new BlogPost({ title: 'JS is great', content: 'Yep it really is' });

    joe.blogPosts.push(blogPost);

    Promise.all([joe.save(), blogPost.save()])
      .then(() => done());
  });


  it('users clean up dangling blogposts on remove', (done) => {
    joe.remove()  // will check if blogPost is 0 after remove => function is asynchronous
      .then(() => BlogPost.count())
      .then((count) => {
        assert(count === 0);
        done();
      });
  });

});