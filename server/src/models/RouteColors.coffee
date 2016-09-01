Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteColors = sequelize.define 'RouteColors',
    name: Sequelize.STRING
    value: Sequelize.STRING

  RouteColors
