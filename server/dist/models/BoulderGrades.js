var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var BoulderGrades;
  BoulderGrades = sequelize.define('BoulderGrades', {
    name: Sequelize.STRING
  });
  return BoulderGrades;
})();
