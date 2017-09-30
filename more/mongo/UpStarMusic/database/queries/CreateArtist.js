const Artist = require('../models/artist');

/**
 * Finds a single artist in the artist collection.
 * @param {object} artistProps - Object containing a name, age, yearsActive, and genre
 * @return {promise} A promise that resolves with the Artist that was created
 */
module.exports = (artistProps) => {
  // console.log(artistProps);
  // we're initializing new artist using artistProps (info from the form)
  const artist = new Artist(artistProps);

  // have to return some value
  return artist.save();
};
