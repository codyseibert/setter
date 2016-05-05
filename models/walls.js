/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('walls', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    gym_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    last_update: {
      type: DataTypes.DATE,
      allowNull: false
    },
    image_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'images',
        key: 'id'
      }
    },
    angle: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: ''
    },
    type: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      defaultValue: '0'
    }
  }, {
    tableName: 'walls'
  });
};
