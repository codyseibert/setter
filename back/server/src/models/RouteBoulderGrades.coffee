Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RouteBoulderGrades = sequelize.define 'RouteBoulderGrades',
    name: Sequelize.STRING
    value: Sequelize.INTEGER

  RouteBoulderGrades
