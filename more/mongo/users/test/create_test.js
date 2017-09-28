// to use assertions
const assert = require('assert');
// import specific file to have access to User model
// it's entire collection of data that sits in our database
const User = require('../src/user')

// make sure we can create a user and save it in the db
describe('Creating records', () => {
  it('saves a user', () => {
    // create user => we're creating new instance of User model
    // joe => becomes instance of the user
    // joe is in the memory (not in the db yet)
    const joe = new User({ name: 'Joe' })

    // save a user
    joe.save();
  });
});