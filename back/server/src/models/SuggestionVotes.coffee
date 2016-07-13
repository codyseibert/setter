Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  SuggestionVotes = sequelize.define 'SuggestionVotes',
    suggestionId: Sequelize.INTEGER
    accountId: Sequelize.INTEGER

  SuggestionVotes
