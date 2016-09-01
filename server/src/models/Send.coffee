Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Send = sequelize.define 'Send',
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER
    date: Sequelize.DATE

  Send
