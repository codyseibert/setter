var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Rating;
  Rating = sequelize.define('Rating', {
    routeId: Sequelize.INTEGER,
    userId: Sequelize.INTEGER,
    rating: Sequelize.INTEGER
  });
  return Rating;
})();
