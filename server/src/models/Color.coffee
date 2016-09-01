Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Color = sequelize.define 'Color',
    name: Sequelize.STRING
    value: Sequelize.STRING

  Color
