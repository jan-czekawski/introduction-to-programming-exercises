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
        // console.log(users[0]._id);
        // console.log(joe._id);
        // compare id of the first user in array to joes => without toString => error
        // cause _id wrapped in ObjectId
        assert(users[0]._id.toString() === joe._id.toString()) 
        done();
      });
  });
});