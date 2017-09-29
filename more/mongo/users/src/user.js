const mongoose = require('mongoose');
// create schema object
const Schema  = mongoose.Schema;

// when we create User Model (all data in single collection in mongo db)
// mongoose will automatically create collection of users in our db

// single user => instance of User Model

const UserSchema = new Schema({
  // expect every user to have "name" property and for it to be string
  name: String,
  postCount: Number
});

// create User Model => reassign it to User var (User class/model)
// it represents entire collection of data (all users)
// 'user' is not available => mongoose creates that model
const User = mongoose.model('user', UserSchema);

// making sure that when this file is required (from other files), someone
// can have access to User model
module.exports = User;

// very common to export just User model