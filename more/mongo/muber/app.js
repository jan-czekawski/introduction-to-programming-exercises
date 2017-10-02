const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const routes = require('./routes/routes');
// based on the info in the request; app will run some particular code (access model, go through controller to mongo etc.)
const app = express();

mongoose.Promise = global.Promise;

// connect to test db in test_helper (easier to check that mongoose connected to mongo and run tests after connection)
if (process.env.NODE_ENV !== 'test') {
  // connect mongoose with instance of the mongo
  mongoose.connect('mongodb://localhost/muber');  
}


// request handler (2nd arg is callback function)
// whenever you get http request with method GET


// start of middleware
// app.post, app.put, app.delete('')
// APP.USE(BODYPARSER) HAVE TO BE DECLARED BEFORE ROUTES(APP) !!!

// body parser
app.use(bodyParser.json()) // .json is functioned (invoked here) => any incoming request are parsed into JSON
// route handler
routes(app)
// error handler
app.use((err, req, res, next) => {
  res.status(422).send({ error: err.message }); // status 422 => unprocessable entity (validation err)
});


module.exports = app;