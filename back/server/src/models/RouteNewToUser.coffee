Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteNewToUser = sequelize.define 'RouteNewToUser',
    gymId: Sequelize.INTEGER
    wallId: Sequelize.INTEGER
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER

  RouteNewToUser
