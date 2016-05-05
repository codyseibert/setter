/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('setters_gyms_access', {
    setter_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    gym_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'accounts',
        key: 'id'
      }
    }
  }, {
    tableName: 'setters_gyms_access'
  });
};
