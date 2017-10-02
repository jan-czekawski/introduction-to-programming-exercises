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
  create(req, res, next) {  // next is key to handlers in express
    // and you've included some email for that driver
    const driverProps = req.body;
    // you should be creating the driver and saving that and sending back to person who done the request
    Driver.create(driverProps)
      .then(driver => res.send(driver))
      .catch(next);
  }

  edit(req, res, next) {
    const driverId = req.params.id; // .id has to match with :id in app.put('/api/drivers/:id') in routes.js
    const driverProps = req.body;

    Driver.findByIdAndUpdate({ _id: driverId }, driverProps) // it doesn't return object, that was updated !!!
      .then(() => Driver.findById({ _id: driverId }))
      .then(driver => res.send(driver))
      .catch(next);    
  }
};