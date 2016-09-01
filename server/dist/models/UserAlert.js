var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var UserAlert;
  UserAlert = sequelize.define('UserAlert', {
    userId: Sequelize.INTEGER,
    alertId: Sequelize.INTEGER
  });
  return UserAlert;
})();
