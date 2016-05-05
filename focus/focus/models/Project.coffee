module.exports =
  attributes:
    userId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'users'
        key: 'account_id'
    routeId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'routes'
        key: 'id'
    date:
      type: 'DATE'
      allowNull: false
