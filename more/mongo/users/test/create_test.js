// to use assertions
const assert = require('assert');
// import specific file to have access to User model
// it's entire collection of data that sits in our database
const User = require('../src/user');

// make sure we can create a user and save it in the db
describe('Creating records', () => {
  // will make reference to "done" callback => to make sure mocha waits after save, assertion is 
  // done before going to the next test
  it('saves a user', (done) => {
    // create user => we're creating new instance of User model
    // joe => becomes instance of the user
    // joe is in the memory (not in the db yet)
    const joe = new User({ name: 'Joe' })

    // save a user
    // but it's gonna take some time, we need make sure that assertions starts after
    // save is finished => will use Promise
    joe.save()
      .then(() => {
        // Has joe been saved successfully?
        assert(!joe.isNew);
        // now we tell mocha that it's done
        done();
      });
  });
});