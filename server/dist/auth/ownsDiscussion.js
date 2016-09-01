var Discussion, jwt;

jwt = require('jsonwebtoken');

Discussion = require('../models/Discussion');

module.exports = function(req, res, next) {
  return Discussion.findOne({
    where: {
      id: req.params.id
    }
  }).then(function(discussion) {
    if (discussion == null) {
      res.status(400);
      return res.send('id was not found');
    } else if (discussion.accountId === req.user.id) {
      return next();
    } else {
      res.status(403);
      return res.send('unauthorized');
    }
  });
};
