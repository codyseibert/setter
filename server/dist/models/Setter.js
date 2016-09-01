var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Setter;
  Setter = sequelize.define('Setter', {
    gymId: Sequelize.INTEGER,
    firstname: Sequelize.STRING,
    lastname: Sequelize.STRING,
    image: Sequelize.STRING
  });
  return Setter;
})();
