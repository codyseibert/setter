var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Wall;
  Wall = sequelize.define('Wall', {
    name: Sequelize.STRING,
    gymId: Sequelize.INTEGER,
    lastUpdate: Sequelize.DATE,
    image: Sequelize.STRING,
    angle: Sequelize.STRING,
    type: Sequelize.INTEGER
  });
  return Wall;
})();
