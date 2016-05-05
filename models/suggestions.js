/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('suggestions', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    account_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    suggestion: {
      type: DataTypes.TEXT,
      allowNull: false
    }
  }, {
    tableName: 'suggestions'
  });
};
