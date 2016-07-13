var app;

app = require('angular').module('setter');

app.service('AccountService', require('./AccountService'));

app.service('AlertService', require('./AlertService'));

app.service('BoulderGradesService', require('./BoulderGradesService'));

app.service('ColorService', require('./ColorService'));

app.service('CommentService', require('./CommentService'));

app.service('FeedbackService', require('./FeedbackService'));

app.service('FeedbackVoteService', require('./FeedbackVoteService'));

app.service('GymService', require('./GymService'));

app.service('RatingService', require('./RatingService'));

app.service('ProjectService', require('./ProjectService'));

app.service('RolesService', require('./RolesService'));

app.service('RopeGradesService', require('./RopeGradesService'));

app.service('RouteService', require('./RouteService'));

app.service('RouteNewToUserService', require('./RouteNewToUserService'));

app.service('SendService', require('./SendService'));

app.service('SetterService', require('./SetterService'));

app.service('SuggestionService', require('./SuggestionService'));

app.service('UserService', require('./UserService'));

app.service('ZoneService', require('./ZoneService'));
