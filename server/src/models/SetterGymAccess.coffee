Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  SetterGymAccess = sequelize.define 'SetterGymAccess',
    setterId: Sequelize.INTEGER
    gymId: Sequelize.INTEGER

  SetterGymAccess
