module.exports =
  attributes:
    email:
      type: 'STRING'
      allowNull: false
    password:
      type: 'STRING'
      allowNull: false
    typeId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts_types'
        key: 'id'
    token:
      type: 'STRING'
      allowNull: true
    image:
      type: 'STRING'
      allowNull: true
      references:
        model: 'images'
        key: 'id'
