var GymAlert, jwt;

jwt = require('jsonwebtoken');

GymAlert = require('../models/GymAlert');

module.exports = function(req, res, next) {
  return GymAlert.findOne({
    where: {
      id: req.params.id
    }
  }).then(function(alert) {
    if (alert == null) {
      res.status(400);
      return res.send('id was not found');
    } else if (alert.gymId === req.user.id) {
      return next();
    } else {
      res.status(403);
      return res.send('unauthorized');
    }
  });
};
