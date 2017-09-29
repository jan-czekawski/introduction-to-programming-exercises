const assert = require('assert');
const User = require('../src/user');

describe('Updating records', () => {
  let joe;

  beforeEach((done) => {
    joe = new User({ name: 'Joe' });
    joe.save()
      .then(() => done())
  });

  // argument will be result of the save/update =>
  // promise => that's result of some operation
  function assertName(operation, done){ // have to pass done, so it's in the same scope
    operation
      .then(() => User.find({})) // empty object => no criteria => find all
      .then((users) => {  // User.find returns promise with array => assigned to "users"
        assert(users.length === 1);
        assert(users[0].name === 'Alex');
        done();
      });
  }

  it('instance set n save', (done) => {
    // to update record
    joe.set('name', 'Alex'); // only in memory, no update in db
    // can update many records and when ready just call .save() once
    // joe.save() // it's done when passed to function as argument
    // will pull out all the users we have and assert that there's only 1 with name Alex
    assertName(joe.save(), done); // done has to be passed to the function
  });

  // IN WEB SERVER WE COULD ANSWER TO INCOMING REQUESTS WITH THOSE FUNCTIONS
  // function maybeUpdateName(user){

  // }

  // function maybeUpdateEmail(user){

  // }

  // maybeUpdateName(user);
  // maybeUpdateEmail(user);
  // user.save();   // we'd call save wether property was updated or not => calling save only once!

  it('A model instance can update', (done) => {
    assertName(joe.update({ name: 'Alex' }), done);
  });

  it('A model class can update', (done) => {
    // very similar to delete
    assertName(
      // would replace ALL the records with the name Joe to Alex
      User.update({ name: 'Joe' }, { name: 'Alex' }), 
      done
    );
  });

  it('A model class can update 1 record', (done) => {
    assertName(
      User.findOneAndUpdate({ name: 'Joe' }, { name: 'Alex' }),
      done
    );
  });

  it('A model class can find a record with an Id and update', (done) => {
    assertName(
      User.findByIdAndUpdate(joe._id, { name: 'Alex' }),
      done
    );
  });

});