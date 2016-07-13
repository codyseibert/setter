Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  BoulderGrades = sequelize.define 'BoulderGrades',
    name: Sequelize.STRING

  BoulderGrades
