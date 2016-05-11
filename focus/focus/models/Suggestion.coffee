module.exports =
  attributes:
    gymId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'gyms'
        key: 'account_id'
    userId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'users'
        key: 'account_id'
    message:
      type: 'STRING'
      allowNull: false
    read:
      type: 'BOOLEAN'
      allowNull: false
      defaultValue: '0'
    date:
      type: 'DATE'
      allowNull: false
