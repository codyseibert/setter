Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Alert = sequelize.define 'Alert',
    gymId: Sequelize.INTEGER
    message: Sequelize.STRING
    date: Sequelize.DATE

  Alert
