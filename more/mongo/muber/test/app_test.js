const assert = require('assert');
const request = require('supertest'); // convention break different name than name of the package
const app = require('../app');

describe('The express app', () => {
  it('handles a GET request to /api', (done) => {
    request(app)
      .get('/api') // could also chain .send => to send some info
      .end((err, response) => {
        // err => physical error (not response state error)
        assert(response.body.hi === 'there');
        done();
      });
  });
});