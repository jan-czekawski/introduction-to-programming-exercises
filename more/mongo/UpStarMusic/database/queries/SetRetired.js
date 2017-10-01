const Artist = require('../models/artist');

/**
 * Sets a group of Artists as retired
 * @param {array} _ids - An array of the _id's of of artists to update
 * @return {promise} A promise that resolves after the update
 */
module.exports = (_ids) => {
  // this cause to only 1 user be retired (if try to select multiple users at once)
  // model.update has option multi(boolean) defaulted to false (can't update multiple docs)
  return Artist.update(
    { _id: { $in: _ids } },
    { retired: true },
    { multi: true } // have to pass that option !!!
  );
};
