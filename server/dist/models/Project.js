var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Project;
  Project = sequelize.define('Project', {
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER,
    date: Sequelize.DATE
  });
  return Project;
})();
