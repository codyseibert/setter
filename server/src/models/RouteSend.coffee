Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteSend = sequelize.define 'RouteSend',
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER
    date: Sequelize.DATE

  RouteSend
