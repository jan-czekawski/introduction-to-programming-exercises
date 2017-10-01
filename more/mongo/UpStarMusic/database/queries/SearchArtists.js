const Artist = require('../models/artist');

/**
 * Searches through the Artist collection
 * @param {object} criteria An object with a name, age, and yearsActive
 * @param {string} sortProperty The property to sort the results by
 * @param {integer} offset How many records to skip in the result set
 * @param {integer} limit How many records to return in the result set
 * @return {promise} A promise that resolves with the artists, count, offset, and limit
    it should be returned like this => { all: [artists], count: count, offset: offset, limit: limit }
 */                                             // default values ES6
module.exports = (criteria, sortProperty, offset = 0, limit = 20) => {
  // write a query that will follow sort, offset, limit options only, no criteria
  // // my solution
  // const artists = Artist.find({})
  // const count = artists.length
  // return { all: [artists], count: count, offset: offset, limit: limit}

  // ES5 way => oldschool
  // const sortOrder = {}
  // sortOrder[sortProperty] = 1;

  // ES6 way
  const query = Artist.find({})
    .sort({ [sortProperty]: 1 }) // [sortProperty] is NOT ARRAY, it's ES6 interpolated property
    .skip(offset)                // at runtime look at the sortProperty, whatever the value is equal
    .limit(limit);               // set that value as key and set value of the key as 1


  return Promise.all([query, Artist.count()]) // count is asynchronous
    .then((results) => {
      return {
        all: results[0],  // result of the "query"
        count: results[1], // result of Artist.count()
        offset: offset,
        limit: limit
      };
    });
};
