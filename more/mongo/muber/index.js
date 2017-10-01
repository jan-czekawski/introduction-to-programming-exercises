const app = require('./app');

// listen for incoming http requests on port 3050 in the current running machine
app.listen(3050, () => {
  console.log('Running on port 3050');
});