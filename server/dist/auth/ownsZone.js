var Zone, jwt;

jwt = require('jsonwebtoken');

Zone = require('../models/Zone');

module.exports = function(req, res, next) {
  return Zone.findOne({
    where: {
      id: req.params.id
    }
  }).then(function(zone) {
    if (zone == null) {
      res.status(400);
      return res.send('id for zone was not found');
    } else if (zone.gymId === req.user.id) {
      return next();
    } else {
      res.status(403);
      return res.send('unauthorized');
    }
  });
};
