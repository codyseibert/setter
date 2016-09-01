var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Send;
  Send = sequelize.define('Send', {
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER,
    date: Sequelize.DATE
  });
  return Send;
})();
