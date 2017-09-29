const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// blogPost will have many comments associated with it
const BlogPostSchema = new Schema({
  title: String,
  content: String,
  // will set up actual reference to another collection, not subdocument
  comments: [{                   // we specify the type of the object, which will be as reference
    type: Schema.Types.ObjectId, // and comments will be from separate collection 
    ref: 'comment' // "comments" will be array of _id's, by assigning ref, we tell mongoose which
  }]               // resource to connect it with => has to be the same as in module.model(...) 
});


const BlogPost = mongoose.model('blogPost', BlogPostSchema);

module.exports = BlogPost;