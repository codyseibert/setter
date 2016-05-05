/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('boulder_grades', {
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
    value: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    }
  }, {
    tableName: 'boulder_grades'
  });
};
