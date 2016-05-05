module.exports =
  attributes:
    userId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'accounts'
        key: 'id'
    routeId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'routes'
        key: 'id'
    date:
      type: 'DATE'
      allowNull: false
