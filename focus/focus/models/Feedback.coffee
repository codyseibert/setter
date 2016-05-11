module.exports =
  attributes:
    accountId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts'
        key: 'id'
    suggestion:
      type: 'TEXT'
      allowNull: false
