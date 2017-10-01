const Artist = require('../models/artist');

/**
 * Deletes a single artist from the Artists collection
 * @param {string} _id - The ID of the artist to delete.
 * @return {promise} A promise that resolves when the record is deleted
 */
module.exports = (_id) => {
  // key and value are identical so
  // Artist.remove({ _id: _id });
  return  Artist.remove({ _id });

  // alternative solutions => DON'T DO IT !!! (touches db twice)
  // return Artist.findById(_id)
  //   .then((artist) => artist.remove())

  // my alternative solution => 1 step only (db touched once)
  // return Artist.findByIdAndRemove(_id);
};
