Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Setter = sequelize.define 'Setter',
    gymId: Sequelize.INTEGER
    firstname: Sequelize.STRING
    lastname: Sequelize.STRING
    image: Sequelize.STRING

  Setter
