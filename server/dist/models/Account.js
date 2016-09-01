var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Account;
  Account = sequelize.define('Account', {
    email: Sequelize.STRING,
    password: Sequelize.STRING,
    image: Sequelize.STRING,
    firstname: Sequelize.STRING,
    lastname: Sequelize.STRING
  });
  return Account;
})();
