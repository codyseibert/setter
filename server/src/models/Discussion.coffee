Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Discussion = sequelize.define 'Discussion',
    gymId: Sequelize.INTEGER
    accountId: Sequelize.INTEGER
    message: Sequelize.STRING
    type: Sequelize.INTEGER

  Discussion
