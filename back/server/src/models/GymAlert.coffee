Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  GymAlert = sequelize.define 'GymAlert',
    gymId: Sequelize.INTEGER
    message: Sequelize.STRING
    date: Sequelize.DATE

  GymAlert
