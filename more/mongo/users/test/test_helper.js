// mongoose was installed as package in a project => we have to require it first
// and assign it to var => "const" we don't expect to change it
const mongoose = require('mongoose');

// we connect with mongo (localhost => we till mongoose to look for mongo on local machine)
// /users_test => name of the db to connect to (if we have multiple db's, mongo has to choose this)
// no need to create that db beforehand; as soon as we connect to it, mongo will create it
mongoose.connect('mongodb://localhost/users_test');

mongoose.connection
// .once, .on are event handlers => .once => watch for event "open" and run once the function
// .on => watch for event called "error" and if it starts run function (with error as arg)
  .once('open', () => console.log('Good to go!'))
  .on('error', (error) => {
    console.warn('Warning', error);
  });


// fat arrow    =>        skinny arrow  ->
