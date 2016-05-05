/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('accounts', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
    type_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts_types',
        key: 'id'
      }
    },
    token: {
      type: DataTypes.STRING,
      allowNull: true
    },
    image_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'images',
        key: 'id'
      }
    }
  }, {
    tableName: 'accounts'
  });
};
