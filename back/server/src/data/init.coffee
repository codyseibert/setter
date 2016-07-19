Color = require '../models/Color'
BoulderGrades = require '../models/BoulderGrades'
RopeGrades = require '../models/RopeGrades'

require('../sequelize').sync().then ->
  for color in require './colors.json'
    Color.create(
      name: color.name
      value: color.value
    )

  for grade in require './boulderGrades.json'
    BoulderGrades.create(
      name: grade.name
    )

  for grade in require './ropeGrades.json'
    RopeGrades.create(
      name: grade.name
    )