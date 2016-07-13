Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Suggestion = sequelize.define 'Suggestion',
    gymId: Sequelize.INTEGER
    userId: Sequelize.INTEGER
    message: Sequelize.STRING
    read: Sequelize.BOOLEAN
    date: Sequelize.DATE

  Suggestion
