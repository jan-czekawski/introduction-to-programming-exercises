const assert = require('assert');
const User = require('../src/user');

describe('Reading users out of the database', () => {
  let joe; // this way joe will be in the functions (multiple: eg beforeEach, it etc) scope  
  let maria, alex, zach

  beforeEach((done) => {
    alex = new User({ name: 'Alex' });
    joe = new User({ name: 'Joe' });
    maria = new User({ name: 'Maria' });
    zach = new User({ name: 'Zach' });

    Promise.all([alex.save(), maria.save(), zach.save(), joe.save()])
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

  it('find user with particular id', (done) => {
    User.findOne({ _id: joe._id })
      .then((user) => {
        assert(user.name === 'Joe');
        done();
      });
  });

  it('can skip and limit result set', (done) => {
    // -Alex- [Joe Maria] Zach
    User.find({})
      .sort({ name: 1 }) // sort all users by name in ascending order(1), desc(-1)
      .skip(1)
      .limit(2)
      .then((users) => {
        assert(users.length === 2);
        assert(users[0].name === 'Joe');
        assert(users[1].name === 'Maria');
        done();
      });
  });

});