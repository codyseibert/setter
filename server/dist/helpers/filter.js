module.exports = {
  create: function(query) {
    var COMMAND_DELIMITOR, SPLIT_DELIMITOR, command, key, split, value, values, where;
    COMMAND_DELIMITOR = '~';
    SPLIT_DELIMITOR = ',';
    where = {};
    if (Object.keys(query).length > 0) {
      where.$and = {};
    }
    for (key in query) {
      value = query[key];
      if (key.indexOf(COMMAND_DELIMITOR) !== -1) {
        split = key.split(COMMAND_DELIMITOR);
        key = split[0];
        command = split[1];
        if (command === 'in') {
          values = value.split(SPLIT_DELIMITOR);
          where.$and[key] = {
            '$in': values
          };
        }
      } else {
        where.$and[key] = value;
      }
    }
    return {
      where: where
    };
  }
};
