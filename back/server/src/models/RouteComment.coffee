Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteComment = sequelize.define 'RouteComment',
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER
    message: Sequelize.STRING
    date: Sequelize.DATE

  RouteComment
