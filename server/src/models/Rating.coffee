Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Rating = sequelize.define 'Rating',
    routeId: Sequelize.INTEGER
    userId: Sequelize.INTEGER
    rating: Sequelize.INTEGER

  Rating
