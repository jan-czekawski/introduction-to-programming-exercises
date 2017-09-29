const assert = require('assert');
const User = require('../src/user');

describe('Subdocuments', () => {
  // create subdocument and save it
  it('can create subdocument', (done) => {
    // when creating new user, have to pass to posts: data that matches
    // posts schema => array/list of records (title, which is string)
    const joe = new User({ 
      name: 'Joe',
      // mongoose will try to automatically apply postschema to object passed to posts:
      posts: [{title: 'PostTitle' }]
    });

    joe.save() // Joe is assigned to variable "joe" and we're saving to db
      .then(() => User.findOne({ name: 'Joe' }))
      .then((user) => { // we fetch Joe from db and assign to another var => user
        assert(user.posts[0].title === 'PostTitle'); // we assert that post is embedded to user
        done();
      });
  });
});