
module.exports =
  attributes:
    gymId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'gyms'
        key: 'account_id'
    wallId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'walls'
        key: 'id'
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
