/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('gym_account_requests', {
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    name: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'gym_account_requests'
  });
};
