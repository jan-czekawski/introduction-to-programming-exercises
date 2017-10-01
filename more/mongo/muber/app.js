const express = require('express');

// based on the info in the request; app will run some particular code (access model, go through controller to mongo etc.)
const app = express();

// request handler (2nd arg is callback function)
// whenever you get http request with method GET

// Watch for incoming request of method GET
// to the route http://localhost:3050/api
app.get('/api', (req, res) => {
  res.send({ hi: 'there' });
});  

// app.post, app.put, app.delete('')

module.exports = app;