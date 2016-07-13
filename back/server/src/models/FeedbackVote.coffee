Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  FeedbackVote = sequelize.define 'FeedbackVote',
    suggestionId: Sequelize.INTEGER
    accountId: Sequelize.INTEGER

  FeedbackVote
