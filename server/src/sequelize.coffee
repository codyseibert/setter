Sequelize = require 'sequelize'
module.exports = do ->
  new Sequelize 'setter', 'root', '123456',
    host: process.env.MYSQL_HOST
