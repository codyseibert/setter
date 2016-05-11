module.exports =
  attributes:
    userId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts'
        key: 'id'
    routeId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'routes'
        key: 'id'
    message:
      type: 'STRING'
      allowNull: false
    date:
      type: 'DATE'
      allowNull: false
