const assert = require('assert');
const request = require('supertest');
const app = require('../../app');

describe('Drivers controller', () => {
  it('Posts to /api/drivers creates a new driver', done => {
    request(app)
      .post('/api/drivers') // they are configurations, .post is faking POST, .send sends sth
      .send({ email: 'test@test.com' }) // email is required  
      .end(() => {
        done();
      });
  });
});