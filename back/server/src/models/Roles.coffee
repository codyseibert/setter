Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Roles = sequelize.define 'Roles',
    name: Sequelize.STRING
    value: Sequelize.STRING

  Roles
