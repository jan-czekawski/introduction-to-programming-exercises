const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// have to include reference to author of the comment
const CommentSchema = new Schema({
  content: String,
  user: { type: Schema.Types.ObjectId, ref: 'user' } // could use "author"/"reviewer" etc
});                                                  // name of the ref has to be the same as
                                                     // in mongoose.model(...) for user model

const Comment = mongoose.model('comment', CommentSchema);

module.exports = Comment;