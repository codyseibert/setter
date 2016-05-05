module.exports =
  attributes:
    gymId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'gyms'
        key: 'account_id'
    message:
      type: 'STRING'
      allowNull: false
    date:
      type: 'DATE'
      allowNull: false
