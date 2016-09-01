var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RopeGrades;
  RopeGrades = sequelize.define('RopeGrades', {
    name: Sequelize.STRING
  });
  return RopeGrades;
})();
