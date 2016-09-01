var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Comment;
  Comment = sequelize.define('Comment', {
    userId: Sequelize.INTEGER,
    routeId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    date: Sequelize.DATE
  });
  return Comment;
})();
