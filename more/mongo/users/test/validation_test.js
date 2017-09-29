const assert = require('assert');
const User = require('../src/user');

describe('Validating records', () => {
  // won't use beforeEach, cause we'd do it preparation test by test if necessary
  it('requires a user name', () => {
    // will validate that user name was provided and that user name is longer than 2 chars
    // we want to be explicit => pass undefined => better than pass empty object !!!
    const user = new User({ name: undefined });
    // validate that model (not save it)
    const validationResult = user.validateSync();
    // const message = validationResult.errors.name.message;
    // using ES6
    const { message } = validationResult.errors.name;
    assert(message === 'Name is required.');
  });

  it('requires a user name longer than 2 characters', () => {
    const user = new User({ name: 'Al' });
    const validationResult = user.validateSync(); //not doing asynchronous validation
    const { message } = validationResult.errors.name;

    assert(message === 'Name must be longer than 2 characters.');
  });

  it('disallows invalid records from being saved', (done) => {
    const user = new User({ name: 'Al' });
    user.save()
      // .catch will be called (instead of .then) when we're trying to save invalid record
      .catch((validationResult) => { 
        const { message } = validationResult.errors.name;

        assert(message === 'Name must be longer than 2 characters.');
        done();
      })
    });
});