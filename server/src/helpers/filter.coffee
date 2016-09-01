module.exports =
  create: (query) ->
    COMMAND_DELIMITOR = '~'
    SPLIT_DELIMITOR = ','

    where = {}

    if Object.keys(query).length > 0
      where.$and = {}

    for key, value of query
      if key.indexOf(COMMAND_DELIMITOR) isnt -1
        split = key.split COMMAND_DELIMITOR
        key = split[0]
        command = split[1]
        if command is 'in'
          values = value.split SPLIT_DELIMITOR
          where.$and[key] =
           '$in': values
      else
        where.$and[key] = value

    where: where
