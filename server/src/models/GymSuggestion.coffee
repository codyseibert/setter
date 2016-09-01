Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  GymSuggestion = sequelize.define 'GymSuggestion',
    gymId: Sequelize.INTEGER
    userId: Sequelize.INTEGER
    message: Sequelize.STRING
    read: Sequelize.BOOLEAN
    date: Sequelize.DATE

  GymSuggestion
