Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Comment = sequelize.define 'Comment',
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER
    message: Sequelize.STRING
    date: Sequelize.DATE

  Comment
