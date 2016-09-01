var Sequelize;

Sequelize = require('sequelize');

module.exports = (function() {
  return new Sequelize('setter', 'root', '123456', {
    host: process.env.MYSQL_HOST
  });
})();
