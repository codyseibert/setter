Sequelize = require 'sequelize'
module.exports = do ->
  new Sequelize 'setter', 'root', '',
    host: 'localhost'
