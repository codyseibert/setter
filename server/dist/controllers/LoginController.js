var Account, Gym, Promise, _, jwt;

Promise = require('bluebird');

_ = require('underscore');

jwt = require('jsonwebtoken');

Gym = require('../models/Gym');

Account = require('../models/Account');

module.exports = (function() {
  var login;
  login = function(req, res) {
    return Gym.findOne({
      where: {
        email: req.body.email,
        password: req.body.password
      }
    }).then(function(gym) {
      var token;
      if (gym != null) {
        gym = gym.toJSON();
        gym.isGymAccount = true;
        token = jwt.sign(gym, process.env.JWT_SECRET);
        res.status(200);
        return res.send(token);
      } else {
        return Account.findOne({
          where: {
            email: req.body.email,
            password: req.body.password
          }
        }).then(function(account) {
          if (account != null) {
            token = jwt.sign(account.toJSON(), process.env.JWT_SECRET);
            res.status(200);
            return res.send(token);
          } else {
            res.status(403);
            return res.send('invalid login information');
          }
        });
      }
    });
  };
  return {
    login: login
  };
})();
