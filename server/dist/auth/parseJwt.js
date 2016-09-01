var jwt;

jwt = require('jsonwebtoken');

module.exports = function(req, res, next) {
  var err, error;
  if (req.headers.authorization == null) {
    res.status(403);
    res.send('token not in header');
    return;
  }
  try {
    req.user = jwt.verify(req.headers.authorization, process.env.JWT_SECRET);
    return next();
  } catch (error) {
    err = error;
    res.status(403);
    return res.send('token validation failed');
  }
};
