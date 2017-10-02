const assert = require('assert');
const request = require('supertest');
const mongoose = require('mongoose');
const app = require('../../app');

// (not requiring it) => workaround, because mocha, mongoose and express don't work together in test env
// mocha tends to try to require more than once (driver may be tried to be created twice)
const Driver = mongoose.model('driver');

describe('Drivers controller', () => {
  it('Posts to /api/drivers creates a new driver', done => {
    // run count first
    Driver.count().then(count => {
      // only after we got the count we start the request
      request(app)
        .post('/api/drivers') // they are configurations, .post is faking POST, .send sends sth
        .send({ email: 'test@test.com' }) // email is required  
        .end(() => {
          
          Driver.count().then(newCount => {
            assert(count + 1 === newCount);
          });
          done();
        });

    });


  });
});