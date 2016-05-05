module.exports =
  attributes:
    setterId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'accounts'
        key: 'id'
    gymId:
      type: 'INTEGER'
      allowNull: false
      primaryKey: true
      references:
        model: 'accounts'
        key: 'id'
