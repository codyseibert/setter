Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Feedback = sequelize.define 'Feedback',
    accountId: Sequelize.INTEGER
    suggestion: Sequelize.TEXT

  Feedback
