module.exports =
  attributes:
    userId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'users'
        key: 'account_id'
    alertId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'alerts'
        key: 'id'
