var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Route;
  Route = sequelize.define('Route', {
    name: Sequelize.STRING,
    gradeId: Sequelize.INTEGER,
    colorId: Sequelize.INTEGER,
    setterId: Sequelize.INTEGER,
    note: Sequelize.STRING,
    date: Sequelize.DATE,
    active: Sequelize.BOOLEAN,
    zoneId: Sequelize.INTEGER,
    type: Sequelize.INTEGER
  });
  return Route;
})();
