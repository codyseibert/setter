/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('sends', {
    user_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    route_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'routes',
        key: 'id'
      }
    },
    date: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    tableName: 'sends'
  });
};
