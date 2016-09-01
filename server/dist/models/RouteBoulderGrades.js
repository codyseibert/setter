var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteBoulderGrades;
  RouteBoulderGrades = sequelize.define('RouteBoulderGrades', {
    name: Sequelize.STRING,
    value: Sequelize.INTEGER
  });
  return RouteBoulderGrades;
})();
