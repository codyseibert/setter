var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Color;
  Color = sequelize.define('Color', {
    name: Sequelize.STRING,
    value: Sequelize.STRING
  });
  return Color;
})();
