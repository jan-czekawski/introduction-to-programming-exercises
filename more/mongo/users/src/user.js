const mongoose = require('mongoose');
// require post schema
const PostSchema = require('./post');
// create schema object
const Schema  = mongoose.Schema;

// when we create User Model (all data in single collection in mongo db)
// mongoose will automatically create collection of users in our db

// single user => instance of User Model

const UserSchema = new Schema({
  // expect every user to have "name" property and for it to be string
  name: {
    type: String,
    validate: {
      // name is argument, after => logic that returns boolean
      validator: (name) => name.length > 2,
      message: 'Name must be longer than 2 characters.'
    },
    required: [true, 'Name is required.'] // require validation
  },
  posts: [PostSchema],
  likes: Number,
  blogPosts: [{ // connect to blogPosts model
    type: Schema.Types.ObjectId,
    ref: 'blogPost'
  }]          
});


// will add virtual property, define function on the property
UserSchema.virtual('postCount').get(function(){
  return this.posts.length;
});

// middleware 
UserSchema.pre('remove', function(next) {
  // this === joe
  const BlogPost = mongoose.model('blogPost'); // this model will only load when function is called

  // this.blogPosts => array of all the posts we want to delete
  // $in => go through all the records in BlogPost collection and look at their id's
  // if id is in array (this.blogPosts) it will remove that record
  BlogPost.remove({ _id: { $in: this.blogPosts } })
    .then(() => next());
})

// create User Model => reassign it to User var (User class/model)
// it represents entire collection of data (all users)
// 'user' is not available => mongoose creates that model
const User = mongoose.model('user', UserSchema);

// making sure that when this file is required (from other files), someone
// can have access to User model
module.exports = User;

// very common to export just User model