Color = require '../models/Color'

require('../sequelize').sync().then ->
  for color in require './colors.json'
    Color.create(
      name: color.name
      value: color.value
    )
