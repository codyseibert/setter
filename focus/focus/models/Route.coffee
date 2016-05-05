module.exports =
  attributes:
    name:
      type: 'STRING'
      allowNull: false
    boulderGradeId:
      type: 'INTEGER'
      allowNull: true
      references:
        model: 'boulder_grades'
        key: 'id'
    topropeGradeId:
      type: 'INTEGER'
      allowNull: true
      references:
        model: 'rope_grades'
        key: 'id'
    colorId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'colors'
        key: 'id'
    setterId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'accounts'
        key: 'id'
    note:
      type: 'STRING'
      allowNull: false
      defaultValue: ''
    date:
      type: 'DATE'
      allowNull: false
    active:
      type: 'BOOLEAN'
      allowNull: false
      defaultValue: '1'
    wallId:
      type: 'INTEGER'
      allowNull: false
      references:
        model: 'walls'
        key: 'id'
    leadGradeId:
      type: 'INTEGER'
      allowNull: true
      references:
        model: 'rope_grades'
        key: 'id'
    type:
      type: 'INTEGER'
      allowNull: true
      defaultValue: '0'
