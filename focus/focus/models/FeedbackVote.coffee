
module.exports =
  attributes:
    suggestionId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'suggestions'
        key: 'id'
    accountId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'accounts'
        key: 'id'
