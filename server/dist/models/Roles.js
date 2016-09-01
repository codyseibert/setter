var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Roles;
  Roles = sequelize.define('Roles', {
    name: Sequelize.STRING,
    value: Sequelize.STRING
  });
  return Roles;
})();
