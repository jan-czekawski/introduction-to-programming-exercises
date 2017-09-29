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


  it('can add subdocuments to an existing record', (done) => {
    // will create record, save it, pull out of db, add post to it, make sure post is saved
    const joe = new User({
      name: 'Joe',
      posts: [] // don't have to do it, but we're being explicit, telling that posts are empty
    });

    joe.save() // we saved joe
      .then(() => User.findOne({ name: 'Joe' })) // we fetched joe (to var user)
      .then((user) => {
        // to add new record inside subdocument collection
        user.posts.push({ title: 'New Post' }); // array => .push => add new post by joe
        return user.save(); // save joe => have to use explicit return to chain another .then
      })
      .then(() => User.findOne({ name: 'Joe' }))
      .then((user) => {
        assert(user.posts[0].title === 'New Post');
        done();
      });
  });

  it('can remove an existing subdocument', (done) => {
    const joe = new User({
      name: 'Joe',
      posts: [{ title: 'New Title' }]
    });

    joe.save()
      .then(() => User.findOne({ name: 'Joe' }))
      .then((user) => {
        // could use Array.splice => but it's pain in the ass
        // will use mongoose's alternative API
        user.posts[0].remove(); // remove() of the subdocument doesn't save automatically !!!
        // const post = user.posts[0]; =>  same code but in stages
        // post.remove( ); 

        return user.save(); // have to explicitly save the document
      })
      .then(() => User.findOne({ name: 'Joe' }))
      .then((user) => {
        assert(user.posts.length === 0);
        done();
      });

  });


});