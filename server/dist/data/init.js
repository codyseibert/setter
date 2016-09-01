var BoulderGrades, Color, Gym, RopeGrades, _;

Color = require('../models/Color');

BoulderGrades = require('../models/BoulderGrades');

RopeGrades = require('../models/RopeGrades');

Gym = require('../models/Gym');

_ = require('lodash');

require('../sequelize').sync().then(function() {
  var color, grade, gym, i, j, k, l, len, len1, len2, len3, ref, ref1, ref2, ref3, results;
  ref = require('./colors.json');
  for (i = 0, len = ref.length; i < len; i++) {
    color = ref[i];
    Color.create({
      name: color.name,
      value: color.value
    });
  }
  ref1 = require('./boulderGrades.json');
  for (j = 0, len1 = ref1.length; j < len1; j++) {
    grade = ref1[j];
    BoulderGrades.create({
      name: grade.name
    });
  }
  ref2 = require('./ropeGrades.json');
  for (k = 0, len2 = ref2.length; k < len2; k++) {
    grade = ref2[k];
    RopeGrades.create({
      name: grade.name
    });
  }
  ref3 = require('./gyms.json');
  results = [];
  for (l = 0, len3 = ref3.length; l < len3; l++) {
    gym = ref3[l];
    results.push(Gym.create({
      name: grade
    }));
  }
  return results;
});
