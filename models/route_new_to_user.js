/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('route_new_to_user', {
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
    wall_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'walls',
        key: 'id'
      }
    },
    user_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'users',
        key: 'account_id'
      }
    },
    route_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'routes',
        key: 'id'
      }
    }
  }, {
    tableName: 'route_new_to_user'
  });
};
