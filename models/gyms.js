/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('gyms', {
    account_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false
    },
    hide_setters: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: '1'
    },
    facebook: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    combined_rope: {
      type: DataTypes.BOOLEAN,
      allowNull: true,
      defaultValue: '1'
    }
  }, {
    tableName: 'gyms'
  });
};
