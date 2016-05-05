/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('users', {
    account_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    gym_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    firstname: {
      type: DataTypes.STRING,
      allowNull: false
    },
    lastname: {
      type: DataTypes.STRING,
      allowNull: false
    },
    bouldering_grade: {
      type: DataTypes.FLOAT,
      allowNull: true,
      defaultValue: '0'
    },
    toprope_grade: {
      type: DataTypes.FLOAT,
      allowNull: true,
      defaultValue: '0'
    },
    lead_grade: {
      type: DataTypes.FLOAT,
      allowNull: true,
      defaultValue: '0'
    }
  }, {
    tableName: 'users'
  });
};
