var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var FeedbackVote;
  FeedbackVote = sequelize.define('FeedbackVote', {
    suggestionId: Sequelize.INTEGER,
    accountId: Sequelize.INTEGER
  });
  return FeedbackVote;
})();
