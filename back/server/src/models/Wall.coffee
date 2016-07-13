Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Wall = sequelize.define 'Wall',
    name: Sequelize.STRING
    gymId: Sequelize.INTEGER
    lastUpdate: Sequelize.DATE
    image: Sequelize.STRING
    angle: Sequelize.STRING
    type: Sequelize.INTEGER

  Wall
