module.exports =
  attributes:
    email:
      type: 'STRING'
    password:
      type: 'STRING'
    token:
      type: 'STRING'
    name:
      type: 'STRING'
      allowNull: false
    address:
      type: 'STRING'
      allowNull: false
    facebook:
      type: 'STRING'
      allowNull: true
    twitter:
      type: 'STRING'
      allowNull: true
    hideSetters:
      type: 'BOOLEAN'
      allowNull: true
      defaultValue: '1'
    combineRope:
      type: 'BOOLEAN'
      allowNull: true
      defaultValue: '1'
