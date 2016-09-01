var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Feedback;
  Feedback = sequelize.define('Feedback', {
    accountId: Sequelize.INTEGER,
    suggestion: Sequelize.TEXT
  });
  return Feedback;
})();
