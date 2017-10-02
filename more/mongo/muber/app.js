const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const routes = require('./routes/routes');
// based on the info in the request; app will run some particular code (access model, go through controller to mongo etc.)
const app = express();

mongoose.Promise = global.Promise;
// connect mongoose with instance of the mongo
mongoose.connect('mongodb://localhost:/muber');

// request handler (2nd arg is callback function)
// whenever you get http request with method GET



// app.post, app.put, app.delete('')
// APP.USE(BODYPARSER) HAVE TO BE DECLARED BEFORE ROUTES(APP) !!!
app.use(bodyParser.json()) // .json is functioned (invoked here) => any incoming request are parsed into JSON
routes(app)

module.exports = app;