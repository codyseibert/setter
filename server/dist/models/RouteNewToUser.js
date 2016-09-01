var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteNewToUser;
  RouteNewToUser = sequelize.define('RouteNewToUser', {
    gymId: Sequelize.INTEGER,
    wallId: Sequelize.INTEGER,
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER
  });
  return RouteNewToUser;
})();
