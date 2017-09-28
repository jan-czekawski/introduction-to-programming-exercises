const assert = require('assert');
const User = require('../src/user');

describe('Reading users out of the database', () => {
  let joe; // this way joe will be in the functions (multiple: eg beforeEach, it etc) scope  

  beforeEach((done) => {
    joe = new User({ name: 'Joe' });
    joe.save()
      .then(() => done()); // done will be called after it's successfully saved
  });

  it('finds all users with name joe', (done) => {
    // have to make sure that collection includes joe => beforeEach
    // find all users
    User.find({ name: 'Joe' })
      .then((users) => {
        console.log(users);
        done();
      });
  });
});