var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteColors;
  RouteColors = sequelize.define('RouteColors', {
    name: Sequelize.STRING,
    value: Sequelize.STRING
  });
  return RouteColors;
})();
