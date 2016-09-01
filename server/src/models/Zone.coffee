Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Zone = sequelize.define 'Zone',
    name: Sequelize.STRING
    gymId: Sequelize.INTEGER
    image: Sequelize.STRING
    angle: Sequelize.STRING
    type: Sequelize.INTEGER

  Zone
