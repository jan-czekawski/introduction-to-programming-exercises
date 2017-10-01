const express = require('express');
const routes = require('./routes/routes');
// based on the info in the request; app will run some particular code (access model, go through controller to mongo etc.)
const app = express();

// request handler (2nd arg is callback function)
// whenever you get http request with method GET



// app.post, app.put, app.delete('')

routes(app)

module.exports = app;