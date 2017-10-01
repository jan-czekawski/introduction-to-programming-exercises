const Artist = require('../models/artist');

/**
 * Finds the lowest and highest yearsActive of artists in the Artist collection
 * @return {promise} A promise that resolves with an object
 * containing the min and max yearsActive, like { min: 0, max: 14 }.
 */
module.exports = () => {
  const minQuery = Artist
    .find({}) // find all artist    
    .sort({ yearsActive: 1 }) // sort by name ASC
    .limit(1) // take only first artist (smallest)  (operations happen in db)
    .then(artists => artists[0].age) // artists is array with 1 element
    // we're only taking the age

  const maxQuery = Artist
    .find({})
    .sort({ yearsActive: -1 }) // sort DESC
    .limit(1)
    .then(artists => artists[0].age)

  return Promise.all([minQuery, maxQuery]) // we have just the ages here
    .then((result) => {
      return { min: result[0], max: result[1] } // return min as smaller, max as bigger
    });
};
