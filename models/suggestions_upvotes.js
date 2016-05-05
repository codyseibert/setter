/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('suggestions_upvotes', {
    suggestion_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'suggestions',
        key: 'id'
      }
    },
    account_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'accounts',
        key: 'id'
      }
    }
  }, {
    tableName: 'suggestions_upvotes'
  });
};
