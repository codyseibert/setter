var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Suggestion;
  Suggestion = sequelize.define('Suggestion', {
    gymId: Sequelize.INTEGER,
    userId: Sequelize.INTEGER,
    message: Sequelize.STRING,
    read: Sequelize.BOOLEAN,
    date: Sequelize.DATE
  });
  return Suggestion;
})();
