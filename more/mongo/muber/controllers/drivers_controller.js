module.exports = {
  // ES6
  greeting(req, res) {

    res.send({ hi: 'there' });
  },

  // ES5
  // greeting: function(req, res){

  // }

  create(req, res) {
    console.log(req.body);
    res.send({ hi: 'there' });
  }
};