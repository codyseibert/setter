Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Project = sequelize.define 'Project',
    userId: Sequelize.INTEGER
    routeId: Sequelize.INTEGER
    date: Sequelize.DATE

  Project
