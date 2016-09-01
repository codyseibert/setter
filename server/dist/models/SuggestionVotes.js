var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var SuggestionVotes;
  SuggestionVotes = sequelize.define('SuggestionVotes', {
    suggestionId: Sequelize.INTEGER,
    accountId: Sequelize.INTEGER
  });
  return SuggestionVotes;
})();
