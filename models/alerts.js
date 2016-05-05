/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('alerts', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    gym_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'gyms',
        key: 'account_id'
      }
    },
    message: {
      type: DataTypes.STRING,
      allowNull: false
    },
    date: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    tableName: 'alerts'
  });
};
