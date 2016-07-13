Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteRating = sequelize.define 'RouteRating',
    routeId: Sequelize.INTEGER
    userId: Sequelize.INTEGER
    rating: Sequelize.INTEGER

  RouteRating
