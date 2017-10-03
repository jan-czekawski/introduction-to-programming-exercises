const DriversController = require('../controllers/drivers_controller');

module.exports = (app) => {

  // Watch for incoming request of method GET
  // to the route http://localhost:3050/api
  app.get('/api', DriversController.greeting); // we're not invoking the function, only declaring

  app.post('/api/drivers', DriversController.create); // we're not invoking the function, no ()

  // have to provide the :id of the record => :id will match anything(wildcard)
  app.put('/api/drivers/:id', DriversController.edit);

  app.delete('/api/drivers/:id', DriversController.delete);

  app.get('/api/drivers', DriversController.index); 

};