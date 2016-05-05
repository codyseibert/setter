/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('alerts_users', {
    user_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'users',
        key: 'account_id'
      }
    },
    alert_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'alerts',
        key: 'id'
      }
    }
  }, {
    tableName: 'alerts_users'
  });
};
