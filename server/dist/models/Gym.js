var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Gym;
  Gym = sequelize.define('Gym', {
    email: Sequelize.STRING,
    password: Sequelize.STRING,
    logo: Sequelize.STRING,
    banner: Sequelize.STRING,
    name: Sequelize.STRING,
    address: Sequelize.STRING,
    website: Sequelize.STRING,
    phone: Sequelize.STRING,
    fax: Sequelize.STRING,
    website: Sequelize.STRING,
    hours: Sequelize.STRING,
    facebook: Sequelize.STRING,
    twitter: Sequelize.STRING,
    hideFacebook: Sequelize.BOOLEAN,
    hideSetters: Sequelize.BOOLEAN,
    combineRope: Sequelize.BOOLEAN,
    active: Sequelize.BOOLEAN,
    trialEndsOn: Sequelize.DATE
  });
  return Gym;
})();
