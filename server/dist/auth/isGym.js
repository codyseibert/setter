module.exports = function(req, res, next) {
  var ref;
  if ((ref = "" + req.user.id) === req.params.id || ref === req.body.gymId) {
    return next();
  } else {
    res.status(403);
    return res.send('unauthorized');
  }
};
