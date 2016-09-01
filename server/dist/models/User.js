var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var User;
  User = sequelize.define('User', {
    accountId: Sequelize.INTEGER,
    gymId: Sequelize.INTEGER,
    firstname: Sequelize.STRING,
    lastname: Sequelize.STRING,
    boulderingGrade: Sequelize.FLOAT,
    topropeGrade: Sequelize.FLOAT,
    leadGrade: Sequelize.FLOAT
  });
  return User;
})();
