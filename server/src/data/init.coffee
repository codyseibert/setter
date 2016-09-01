Color = require '../models/Color'
BoulderGrades = require '../models/BoulderGrades'
RopeGrades = require '../models/RopeGrades'
Gym = require '../models/Gym'
_ = require 'lodash'

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

  for gym in require './gyms.json'
    Gym.create(
      name: grade
    )
