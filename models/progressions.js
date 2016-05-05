/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('progressions', {
    user_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'users',
        key: 'account_id'
      }
    },
    date: {
      type: DataTypes.DATE,
      allowNull: false,
      primaryKey: true
    },
    bouldering_grade: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    toprope_grade: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    lead_grade: {
      type: DataTypes.FLOAT,
      allowNull: true
    }
  }, {
    tableName: 'progressions'
  });
};
