var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var GymAlert;
  GymAlert = sequelize.define('GymAlert', {
    gymId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    date: Sequelize.DATE
  });
  return GymAlert;
})();
