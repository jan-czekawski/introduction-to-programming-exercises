const mongoose = require('mongoose');

before(done => {
  // mongoose.connect('mongodb://localhost/muber');
  mongoose.connect('mongodb://localhost/muber_test');
  // handler => show status of connection
  mongoose.connection
    .once('open', () => done())
    .on('error', err => {
      console.warn('Warning', error);
    });
});

beforeEach(done => {
  const { drivers } = mongoose.connection.collections;
  drivers.drop()
    // it makes sure before any tests are run that index is in place 
    .then(() => drivers.ensureIndex({ 'geometry.coordinates': '2dsphere' }))
    .then(() => done())
    .catch(() => done());
});