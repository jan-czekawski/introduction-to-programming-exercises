const assert = require('assert');
const request = require('supertest');
const mongoose = require('mongoose');
const app = require('../../app');

// (not requiring it) => workaround, because mocha, mongoose and express don't work together in test env
// mocha tends to try to require more than once (driver may be tried to be created twice)
const Driver = mongoose.model('driver');

describe('Drivers controller', () => {
  it('POST to /api/drivers creates a new driver', (done) => {
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

  it('PUT to /api/drivers/id edits an existing driver', done => {
    const driver = new Driver({ email: 't@t.com', driving: false });
  
    driver.save()
      .then(() => {
        request(app)
          // .put('/api/drivers/' + driver._id)
          .put(`/api/drivers/${driver._id}`) // ES6
          .send({ driving: true })
          .end(() => {
            Driver.findOne({ email: 't@t.com' })
              .then(driver => {
                assert(driver.driving === true);
                // assert(driver.driving);  same result, but less explicit for other devs
                done();
              });
          });
      });
  });

  it('DELETE to /api/drivers/id can delete a driver', done => {
    const driver = new Driver({ email: 'test@test.com' });

    driver.save().then(() => {
      request(app)
        .delete(`/api/drivers/${driver._id}`)
        .end(() => {
          Driver.findOne({ email: 'test@test.com' })
            .then((driver) => {
              assert(driver === null);
              done();
            });
        });
    });    
  });

});