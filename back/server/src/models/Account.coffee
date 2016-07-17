Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Account = sequelize.define 'Account',
    email: Sequelize.STRING
    password: Sequelize.STRING
    image: Sequelize.STRING

  Account
