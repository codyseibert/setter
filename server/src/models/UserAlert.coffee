Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  UserAlert = sequelize.define 'UserAlert',
    userId: Sequelize.INTEGER
    alertId: Sequelize.INTEGER

  UserAlert
