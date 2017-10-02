const Driver = require('../models/driver');

module.exports = {
  // ES6
  greeting(req, res) {

    res.send({ hi: 'there' });
  },

  // ES5
  // greeting: function(req, res){

  // }

  // after you make post request to create route
  create(req, res) {
    // and you've included some email for that driver
    const driverProps = req.body;
    // you should be creating the driver and saving that and sending back to person who done the request
    Driver.create(driverProps)
      .then(driver => res.send(driver));
  }
};