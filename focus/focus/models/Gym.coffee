module.exports =
  attributes:
    email:
      type: 'STRING'
    password:
      type: 'STRING'
    token:
      type: 'STRING'
    logo:
      type: 'STRING'
    banner:
      type: 'STRING'
    name:
      type: 'STRING'
    address:
      type: 'STRING'
    facebook:
      type: 'STRING'
      allowNull: true
    twitter:
      type: 'STRING'
      allowNull: true
    hideFacebook:
      type: 'BOOLEAN'
    hideSetters:
      type: 'BOOLEAN'
      allowNull: true
      defaultValue: '1'
    combineRope:
      type: 'BOOLEAN'
      allowNull: true
      defaultValue: '1'
