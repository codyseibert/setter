var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteRating;
  RouteRating = sequelize.define('RouteRating', {
    routeId: Sequelize.INTEGER,
    userId: Sequelize.INTEGER,
    rating: Sequelize.INTEGER
  });
  return RouteRating;
})();
