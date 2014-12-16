/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var app = require('./App');

var RegistrationController = require('./controllers/RegistrationController');
var LoginController = require('./controllers/LoginController');
var WallsController = require('./controllers/WallsController');
var GymsController = require('./controllers/GymsController');
var InjectAccountId = require('./middleware/InjectAccountId');
var SetsController = require('./controllers/SetsController');
var ColorsController = require('./controllers/ColorsController');
var RoutesController = require('./controllers/RoutesController');
var GradesController = require('./controllers/GradesController');
var SettersController = require('./controllers/SettersController');
var RatingController = require('./controllers/RatingsController');
var CommentsController = require('./controllers/CommentsController');
var SendsController = require('./controllers/SendsController');
var UsersController = require('./controllers/UsersController');
var SuggestionsController = require('./controllers/SuggestionsController');
var FeedbackController = require('./controllers/FeedbackController');

var RouteToControllerBinder = function () {
    'use strict';

    // REGISTRATION
    app.post('/api/register/user',
        RegistrationController.registerUser);

    app.post('/api/register/gym',
        RegistrationController.registerGym);

    // LOGIN
    app.post('/api/login',
        LoginController.login);

    // GYMS
    app.get('/api/gyms',
        GymsController.getGyms);

    app.get('/api/gyms/:gymId',
        GymsController.getGym);

    app.get('/api/gyms/:gymId/routes/boulder',
        GymsController.getCurrentBoulderRoutes);

    app.get('/api/gyms/:gymId/routes/rope',
        GymsController.getCurrentRopeRoutes);

    // WALLS
    app.get('/api/gym/:gymId/walls',
        WallsController.getWallsInGym);

    app.get('/api/walls/:wallId',
        InjectAccountId,
        WallsController.getWall);

    app.post('/api/walls',
        InjectAccountId,
        WallsController.createWall);

    app.post('/api/walls/:wallId',
        InjectAccountId,
        WallsController.updateWall);

    app.delete('/api/walls/:wallId',
        InjectAccountId,
        WallsController.deleteWall);

    // SETS
    app.get('/api/sets/:setId',
        SetsController.getSet);

    app.get('/api/walls/:wallId/sets',
        InjectAccountId,
        SetsController.getSetsOnWall);

    app.post('/api/walls/:wallId/sets',
        InjectAccountId,
        SetsController.createSet);

    app.delete('/api/sets/:setId',
        SetsController.deleteSet);

    // ROUTES
    app.get('/api/sets/:setId/routes',
        RoutesController.getRoutesInSet);

    app.post('/api/sets/:setId/routes',
        RoutesController.createRoute);

    app.get('/api/routes/:routeId',
        RoutesController.getRoute);

    app.post('/api/routes/:routeId',
        RoutesController.updateRoute);

    app.delete('/api/routes/:routeId',
        RoutesController.deleteRoute);

    // COMMENTS
    app.get('/api/routes/:routeId/comments',
        CommentsController.getCommentsAboutRoute);

    app.post('/api/routes/:routeId/comments',
        InjectAccountId,
        CommentsController.createComment);

    app.post('/api/comments/:commentId',
        InjectAccountId,
        CommentsController.updateComment);

    app.delete('/api/comments/:commentId',
        InjectAccountId,
        CommentsController.deleteComment);

    // RATINGS
    app.get('/api/routes/:routeId/rating',
        RatingController.getRatingsForRoute);

    app.post('/api/routes/:routeId/rating',
        InjectAccountId,
        RatingController.updateRating);

    app.get('/api/routes/:routeId/hasRated',
        InjectAccountId,
        RatingController.hasRated);

    // SENDS
    app.get('/api/routes/:routeId/sends',
        SendsController.getSendsForRoute);

    app.get('/api/routes/:routeId/hasSent',
        InjectAccountId,
        SendsController.hasSent);

    app.post('/api/routes/:routeId/sends',
        InjectAccountId,
        SendsController.createSend);

    app.delete('/api/routes/:routeId/sends',
        InjectAccountId,
        SendsController.deleteSend);

    // GRADES
    app.get('/api/grades/boulder',
        GradesController.getBoulderGrades);

    app.get('/api/grades/rope',
        GradesController.getRopeGrades);

    // COLORS
    app.get('/api/colors',
        ColorsController.getColors);

    // SETTERS
    app.get('/api/gym/:gymId/setters',
        SettersController.getSettersAtGym);

    app.get('/api/setters',
        InjectAccountId,
        SettersController.getUsers);

    app.post('/api/setters/access',
        InjectAccountId,
        SettersController.createSetterGymAccess);

    app.delete('/api/setters/:setterId/access',
        InjectAccountId,
        SettersController.deleteSetterGymAccess);

    // USERS
    app.get('/api/users/:userId/sends/boulder',
        UsersController.getBoulderSends);

    app.get('/api/users/:userId/sends/rope',
        UsersController.getRopeSends);

    app.get('/api/users/:userId',
        UsersController.getUser);

    app.post('/api/users/homegym/set',
        InjectAccountId,
        UsersController.setHomeGym);

    // SUGGESTIONS
    app.get('/api/suggestions',
        InjectAccountId,
        SuggestionsController.getSuggestions);

    app.post('/api/suggestions',
        InjectAccountId,
        SuggestionsController.createSuggestion);

    app.post('/api/suggestions/:suggestionId/upvote',
        InjectAccountId,
        SuggestionsController.upvoteSuggestion);


    // FEEDBACK
    app.post('/api/feedback',
        FeedbackController.createFeedback);
};

module.exports = new RouteToControllerBinder();
