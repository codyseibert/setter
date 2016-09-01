Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  RopeGrades = sequelize.define 'RopeGrades',
    name: Sequelize.STRING

  RopeGrades
