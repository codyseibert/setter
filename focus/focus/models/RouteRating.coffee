module.exports =
  attributes:
    routeId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'routes'
        key: 'id'
    userId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'accounts'
        key: 'id'
    rating:
      type: 'INTEGER'
      allowNull: false
