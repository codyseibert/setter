var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Discussion;
  Discussion = sequelize.define('Discussion', {
    gymId: Sequelize.INTEGER,
    accountId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    type: Sequelize.INTEGER
  });
  return Discussion;
})();
