Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  User = sequelize.define 'User',
    accountId: Sequelize.INTEGER
    gymId: Sequelize.INTEGER
    firstname: Sequelize.STRING
    lastname: Sequelize.STRING
    boulderingGrade: Sequelize.FLOAT
    topropeGrade: Sequelize.FLOAT
    leadGrade: Sequelize.FLOAT

  User
