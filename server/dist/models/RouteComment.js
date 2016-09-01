var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteComment;
  RouteComment = sequelize.define('RouteComment', {
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    date: Sequelize.DATE
  });
  return RouteComment;
})();
