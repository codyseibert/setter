var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var SetterGymAccess;
  SetterGymAccess = sequelize.define('SetterGymAccess', {
    setterId: Sequelize.INTEGER,
    gymId: Sequelize.INTEGER
  });
  return SetterGymAccess;
})();
