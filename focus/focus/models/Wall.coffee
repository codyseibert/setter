
module.exports =
  attributes:
    name:
      type: 'STRING'
      allowNull: false
    gymId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts'
        key: 'id'
    lastUpdate:
      type: 'DATE'
      allowNull: false
    image:
      type: 'STRING'
      allowNull: true
      references:
        model: 'images'
        key: 'id'
    angle:
      type: 'STRING'
      allowNull: true
      defaultValue: ''
    type:
      type: 'INTEGER'
      allowNull: true
      defaultValue: '0'
