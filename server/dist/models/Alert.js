var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Alert;
  Alert = sequelize.define('Alert', {
    gymId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    date: Sequelize.DATE
  });
  return Alert;
})();
