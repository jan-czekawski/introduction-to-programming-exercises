const assert = require('assert');
const User = require('../src/user');

describe('Deleting a user', () => {
  let joe;

  beforeEach((done) => {
    joe = new User({ name: 'Joe'} );
    joe.save()
      .then(() => done());
  });


  it('model instance remove', (done) => {
    // we need to test if there's existing user with name 'joe' after remove
    joe.remove()
    // .then will be run after joe.remove() is completed
      .then(() => User.findOne({ name: 'Joe'})) 
      // we will create new db operation here and return it to .then
      .then((user) => { // it will be called with user found in the previous .then
        assert(user === null);
        done();
      }) // it will be called when query after first .then is finished

  });

  it('class method remove', () => {

  });

  it('class method findAndRemove', () => {

  });

  it('class method findByIdAndRemove', () => {

  });
});