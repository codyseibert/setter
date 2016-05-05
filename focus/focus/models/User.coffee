module.exports =
  attributes:
    accountId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts'
        key: 'id'
    gymId:
      type: 'INTEGER'
      allowNull: true
      references:
        model: 'accounts'
        key: 'id'
    firstname:
      type: 'STRING'
      allowNull: false
    lastname:
      type: 'STRING'
      allowNull: false
    boulderingGrade:
      type: 'FLOAT'
      allowNull: true
      defaultValue: '0'
    topropeGrade:
      type: 'FLOAT'
      allowNull: true
      defaultValue: '0'
    leadGrade:
      type: 'FLOAT'
      allowNull: true
      defaultValue: '0'
