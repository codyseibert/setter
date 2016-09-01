var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var RouteSend;
  RouteSend = sequelize.define('RouteSend', {
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER,
    date: Sequelize.DATE
  });
  return RouteSend;
})();
