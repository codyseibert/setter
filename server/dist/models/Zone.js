var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Zone;
  Zone = sequelize.define('Zone', {
    name: Sequelize.STRING,
    gymId: Sequelize.INTEGER,
    image: Sequelize.STRING,
    angle: Sequelize.STRING,
    type: Sequelize.INTEGER
  });
  return Zone;
})();
