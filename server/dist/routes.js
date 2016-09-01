var AccountController, BoulderGradesController, ColorController, CommentController, DiscussionController, FeedbackController, FeedbackVoteController, GymAlertController, GymController, LoginController, ProjectController, RatingController, RolesController, RopeGradesController, RouteController, RouteNewToUserController, SendController, SetterController, SuggestionController, UserController, ZoneController, app, isGym, ownsDiscussion, ownsGymAlert, ownsZone, parseJwt;

app = require('./app');

AccountController = require('./controllers/AccountController');

GymAlertController = require('./controllers/GymAlertController');

BoulderGradesController = require('./controllers/BoulderGradesController');

ColorController = require('./controllers/ColorController');

CommentController = require('./controllers/CommentController');

FeedbackController = require('./controllers/FeedbackController');

FeedbackVoteController = require('./controllers/FeedbackVoteController');

GymController = require('./controllers/GymController');

RatingController = require('./controllers/RatingController');

ProjectController = require('./controllers/ProjectController');

RolesController = require('./controllers/RolesController');

RopeGradesController = require('./controllers/RopeGradesController');

RouteController = require('./controllers/RouteController');

RouteNewToUserController = require('./controllers/RouteNewToUserController');

SendController = require('./controllers/SendController');

SetterController = require('./controllers/SetterController');

SuggestionController = require('./controllers/SuggestionController');

UserController = require('./controllers/UserController');

ZoneController = require('./controllers/ZoneController');

LoginController = require('./controllers/LoginController');

DiscussionController = require('./controllers/DiscussionController');

isGym = require('./auth/isGym');

parseJwt = require('./auth/parseJwt');

ownsGymAlert = require('./auth/ownsGymAlert');

ownsZone = require('./auth/ownsZone');

ownsDiscussion = require('./auth/ownsDiscussion');

module.exports = (function() {
  app.post('/Login', LoginController.login);
  app.get('/Accounts', AccountController.find);
  app.get('/Accounts/:id', AccountController.get);
  app.post('/Accounts', AccountController.create);
  app.put('/Accounts/:id', AccountController.update);
  app["delete"]('/Accounts/:id', AccountController.destroy);
  app.get('/GymAlerts', GymAlertController.find);
  app.get('/GymAlerts/:id', GymAlertController.get);
  app.post('/GymAlerts', parseJwt, isGym, GymAlertController.create);
  app.put('/GymAlerts/:id', parseJwt, ownsGymAlert, GymAlertController.update);
  app["delete"]('/GymAlerts/:id', parseJwt, ownsGymAlert, GymAlertController.destroy);
  app.get('/BoulderGradess', BoulderGradesController.find);
  app.get('/BoulderGradess/:id', BoulderGradesController.get);
  app.post('/BoulderGradess', BoulderGradesController.create);
  app.put('/BoulderGradess/:id', BoulderGradesController.update);
  app["delete"]('/BoulderGradess/:id', BoulderGradesController.destroy);
  app.get('/Colors', ColorController.find);
  app.get('/Colors/:id', ColorController.get);
  app.post('/Colors', ColorController.create);
  app.put('/Colors/:id', ColorController.update);
  app["delete"]('/Colors/:id', ColorController.destroy);
  app.get('/Comments', CommentController.find);
  app.get('/Comments/:id', CommentController.get);
  app.post('/Comments', CommentController.create);
  app.put('/Comments/:id', CommentController.update);
  app["delete"]('/Comments/:id', CommentController.destroy);
  app.get('/Feedbacks', FeedbackController.find);
  app.get('/Feedbacks/:id', FeedbackController.get);
  app.post('/Feedbacks', FeedbackController.create);
  app.put('/Feedbacks/:id', FeedbackController.update);
  app["delete"]('/Feedbacks/:id', FeedbackController.destroy);
  app.get('/FeedbackVotes', FeedbackVoteController.find);
  app.get('/FeedbackVotes/:id', FeedbackVoteController.get);
  app.post('/FeedbackVotes', FeedbackVoteController.create);
  app.put('/FeedbackVotes/:id', FeedbackVoteController.update);
  app["delete"]('/FeedbackVotes/:id', FeedbackVoteController.destroy);
  app.get('/Gyms', GymController.find);
  app.get('/Gyms/:id', GymController.get);
  app.post('/Gyms', GymController.create);
  app.put('/Gyms/:id', parseJwt, isGym, GymController.update);
  app["delete"]('/Gyms/:id', GymController.destroy);
  app.get('/Ratings', RatingController.find);
  app.get('/Ratings/:id', RatingController.get);
  app.post('/Ratings', RatingController.create);
  app.put('/Ratings/:id', RatingController.update);
  app["delete"]('/Ratings/:id', RatingController.destroy);
  app.get('/Projects', ProjectController.find);
  app.get('/Projects/:id', ProjectController.get);
  app.post('/Projects', ProjectController.create);
  app.put('/Projects/:id', ProjectController.update);
  app["delete"]('/Projects/:id', ProjectController.destroy);
  app.get('/Roless', RolesController.find);
  app.get('/Roless/:id', RolesController.get);
  app.post('/Roless', RolesController.create);
  app.put('/Roless/:id', RolesController.update);
  app["delete"]('/Roless/:id', RolesController.destroy);
  app.get('/RopeGradess', RopeGradesController.find);
  app.get('/RopeGradess/:id', RopeGradesController.get);
  app.post('/RopeGradess', RopeGradesController.create);
  app.put('/RopeGradess/:id', RopeGradesController.update);
  app["delete"]('/RopeGradess/:id', RopeGradesController.destroy);
  app.get('/Routes', RouteController.find);
  app.get('/Routes/:id', RouteController.get);
  app.post('/Routes', RouteController.create);
  app.put('/Routes/:id', RouteController.update);
  app["delete"]('/Routes/:id', RouteController.destroy);
  app.get('/RouteNewToUsers', RouteNewToUserController.find);
  app.get('/RouteNewToUsers/:id', RouteNewToUserController.get);
  app.post('/RouteNewToUsers', RouteNewToUserController.create);
  app.put('/RouteNewToUsers/:id', RouteNewToUserController.update);
  app["delete"]('/RouteNewToUsers/:id', RouteNewToUserController.destroy);
  app.get('/Sends', SendController.find);
  app.get('/Sends/:id', SendController.get);
  app.post('/Sends', SendController.create);
  app.put('/Sends/:id', SendController.update);
  app["delete"]('/Sends/:id', SendController.destroy);
  app.get('/Setters', SetterController.find);
  app.get('/Setters/:id', SetterController.get);
  app.post('/Setters', parseJwt, isGym, SetterController.create);
  app.put('/Setters/:id', SetterController.update);
  app["delete"]('/Setters/:id', SetterController.destroy);
  app.get('/Suggestions', SuggestionController.find);
  app.get('/Suggestions/:id', SuggestionController.get);
  app.post('/Suggestions', SuggestionController.create);
  app.put('/Suggestions/:id', SuggestionController.update);
  app["delete"]('/Suggestions/:id', SuggestionController.destroy);
  app.get('/Users', UserController.find);
  app.get('/Users/:id', UserController.get);
  app.post('/Users', UserController.create);
  app.put('/Users/:id', UserController.update);
  app["delete"]('/Users/:id', UserController.destroy);
  app.get('/Zones', ZoneController.find);
  app.get('/Zones/:id', ZoneController.get);
  app.post('/Zones', parseJwt, isGym, ZoneController.create);
  app.put('/Zones/:id', parseJwt, ownsZone, ZoneController.update);
  app["delete"]('/Zones/:id', ZoneController.destroy);
  app.get('/Discussions', DiscussionController.find);
  app.get('/Discussions/:id', DiscussionController.get);
  app.post('/Discussions', DiscussionController.create);
  app.put('/Discussions/:id', parseJwt, ownsDiscussion, DiscussionController.update);
  return app["delete"]('/Discussions/:id', parseJwt, ownsDiscussion, DiscussionController.destroy);
})();
