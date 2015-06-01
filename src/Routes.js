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
var AccountsController = require('./controllers/AccountsController');
var GymsController = require('./controllers/GymsController');
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
var ImagesController = require('./controllers/ImagesController');
var BlogController = require('./controllers/BlogController');
var GymSuggestionsController = require('./controllers/GymSuggestionsController');
var AlertsController = require('./controllers/AlertsController');
var GymAccountRequestsController = require('./controllers/GymAccountRequestsController');
var ProjectsController = require('./controllers/ProjectsController');

var InjectAccountId = require('./middleware/InjectAccountId');
var InjectAccountIdUsingEmail = require('./middleware/InjectAccountIdUsingEmail');
var ValidateGymAdmin = require('./middleware/ValidateGymAdmin');

var RouteToControllerBinder = function () {
    'use strict';





    // REGISTRATION
    app.post('/api/register/user',
        RegistrationController.registerUser);





    // LOGIN
    app.post('/api/login',
        LoginController.login);





    // LOST PASSWORD
    app.post('/api/password/reset',
        InjectAccountIdUsingEmail,
        AccountsController.mailNewPassword);



    // SETTINGS
    app.get('/api/account/settings',
      InjectAccountId,
      AccountsController.getSettings);

    app.post('/api/account/settings',
      InjectAccountId,
      AccountsController.updateSettings);


    // CHANGE PASSWORD
    app.post('/api/password/change',
        InjectAccountId,
        AccountsController.changePassword);





    // GYMS
    app.get('/api/gyms',
        GymsController.getGyms);

    app.get('/api/gyms/:gymId',
        InjectAccountId,
        GymsController.getGym);

    app.get('/api/gyms/:gymId/settings',
        GymsController.getGymSettings);


    app.get('/api/gyms/:gymId/comments',
        GymsController.getLatestComments);



    /*
    *   SECTION - Distribution Chart
    */
    app.get('/api/gyms/:gymId/routes/boulder/distribution',
        InjectAccountId,
        GymsController.getBoulderRouteDistribution);

    app.get('/api/gyms/:gymId/routes/toprope/distribution',
        InjectAccountId,
        GymsController.getTopRopeRouteDistribution);

    app.get('/api/gyms/:gymId/routes/toprope/distribution',
        InjectAccountId,
        GymsController.getLeadRouteDistribution);




    /*
    *   SECTION - Best Routes
    */
    app.get('/api/gyms/:gymId/routes/boulder/best',
        InjectAccountId,
        GymsController.getBestRatedBoulder);

    app.get('/api/gyms/:gymId/routes/toprope/best',
        InjectAccountId,
        GymsController.getBestRatedTopRope);

    app.get('/api/gyms/:gymId/routes/lead/best',
        InjectAccountId,
        GymsController.getBestRatedLead);


    app.get('/api/gyms/:gymId/routes/:type/dist',
        InjectAccountId,
        GymsController.getDistributions);


    /*
    *   SECTION - Routes by Type
    */
    app.get('/api/gyms/:gymId/routes/boulder',
        InjectAccountId,
        GymsController.getCurrentBoulderRoutes);

    app.get('/api/gyms/:gymId/routes/toprope',
        InjectAccountId,
        GymsController.getCurrentTopRopeRoutes);

    app.get('/api/gyms/:gymId/routes/lead',
        InjectAccountId,
        GymsController.getCurrentLeadRoutes);




    /*
    *   SECTION - Newest Routes by Type
    */
    app.get('/api/gyms/:gymId/routes/boulder/new',
        InjectAccountId,
        GymsController.getNewestBoulder);

    app.get('/api/gyms/:gymId/routes/toprope/new',
        InjectAccountId,
        GymsController.getNewestTopRope);

    app.get('/api/gyms/:gymId/routes/lead/new',
        InjectAccountId,
        GymsController.getNewestLead);




    /*
    *   SECTION - Newest Routes by Type
    */
    app.get('/api/gyms/:gymId/routes/new',
        InjectAccountId,
        GymsController.getNumberOfNewRoutes);

    app.get('/api/gyms/:gymId/users',
        InjectAccountId,
        GymsController.getHomeGymUsers);

    app.get('/api/gyms/:gymId/projects',
        InjectAccountId,
        GymsController.getLatestProjects);


    /*
    *   SECTION - User Grade Dist Chart
    */
    app.get('/api/gyms/:gymId/users/grades/:type',
        InjectAccountId,
        GymsController.getGymUsersGrades);



    app.get('/api/gyms/:gymId/image',
        InjectAccountId,
        GymsController.getGymImage);

    app.get('/api/gyms/:gymId/activity',
        InjectAccountId,
        GymsController.getActivityStream);

    app.get('/api/gyms/:gymId/suggestions',
        InjectAccountId,
        ValidateGymAdmin,
        GymSuggestionsController.getSuggestionsForGym);

    app.post('/api/gyms/:gymId/suggestions',
        InjectAccountId,
        GymSuggestionsController.createSuggestion);

    app.get('/api/gyms/:gymId/alerts',
        InjectAccountId,
        AlertsController.getAlertsForGym);

    app.post('/api/gyms/:gymId/alerts',
        InjectAccountId,
        ValidateGymAdmin,
        AlertsController.createAlert);







    // WALLS
    app.get('/api/gyms/:gymId/walls',
        InjectAccountId,
        WallsController.getWallsInGym);

    app.post('/api/gyms/:gymId/walls',
        InjectAccountId,
        ValidateGymAdmin,
        WallsController.createWall);

    app.get('/api/gyms/:gymId/walls/:wallId',
        InjectAccountId,
        WallsController.getWall);

    app.post('/api/gyms/:gymId/walls/:wallId',
        InjectAccountId,
        ValidateGymAdmin,
        WallsController.updateWall);

    app.post('/api/gyms/:gymId/walls/:wallId/image',
        InjectAccountId,
        ValidateGymAdmin,
        ImagesController.uploadWallImage);

    app.delete('/api/gyms/:gymId/walls/:wallId',
        InjectAccountId,
        ValidateGymAdmin,
        WallsController.deleteWall);

    app.post('/api/gyms/:gymId/walls/:wallId/strip',
        InjectAccountId,
        ValidateGymAdmin,
        WallsController.stripZone);





    // ROUTES
    app.get('/api/walls/:wallId/routes',
        InjectAccountId,
        RoutesController.getRoutesOnWall);

    app.get('/api/gyms/:gymId/routes',
        InjectAccountId,
        ValidateGymAdmin,
        RoutesController.getRoutesInGym);

    app.get('/api/gyms/:gymId/routes/all',
        InjectAccountId,
        RoutesController.getRoutesInGym2);

    app.post('/api/gyms/:gymId/walls/:wallId/routes',
        InjectAccountId,
        ValidateGymAdmin,
        RoutesController.createRoute);

    app.delete('/api/routes/:routeId/setAsViewed',
        InjectAccountId,
        RoutesController.deleteNewRouteToUserAlert);

    app.get('/api/routes/:routeId',
        InjectAccountId,
        RoutesController.getRoute);

    app.post('/api/gyms/:gymId/routes/:routeId',
        InjectAccountId,
        ValidateGymAdmin,
        RoutesController.updateRoute);

    app.delete('/api/gyms/:gymId/routes/:routeId',
        InjectAccountId,
        ValidateGymAdmin,
        RoutesController.deleteRoute);

    app.post('/api/gyms/:gymId/routes/:routeId/strip',
        InjectAccountId,
        ValidateGymAdmin,
        RoutesController.stripRoute);





    // COMMENTS
    app.get('/api/routes/:routeId/comments',
        InjectAccountId,
        CommentsController.getCommentsAboutRoute);

    app.post('/api/routes/:routeId/comments',
        InjectAccountId,
        CommentsController.createComment);





    // RATINGS
    app.get('/api/routes/:routeId/rating',
        InjectAccountId,
        RatingController.getRatingsForRoute);

    app.post('/api/routes/:routeId/rating',
        InjectAccountId,
        RatingController.updateRating);

    app.get('/api/routes/:routeId/hasRated',
        InjectAccountId,
        RatingController.hasRated);





    // SENDS
    app.get('/api/routes/:routeId/sends',
        InjectAccountId,
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



    // PROJECTS
    app.get('/api/routes/:routeId/projects',
        ProjectsController.getProjectsForRoute);

    app.get('/api/routes/:routeId/isProject',
        InjectAccountId,
        ProjectsController.isProject);

    app.post('/api/routes/:routeId/projects',
        InjectAccountId,
        ProjectsController.createProject);

    app.delete('/api/routes/:routeId/projects',
        InjectAccountId,
        ProjectsController.deleteProject);






    // GRADES
    app.get('/api/grades/boulder',
        InjectAccountId,
        GradesController.getBoulderGrades);

    app.get('/api/grades/rope',
        InjectAccountId,
        GradesController.getRopeGrades);





    // COLORS
    app.get('/api/colors',
        InjectAccountId,
        ColorsController.getColors);





    // SETTERS
    app.get('/api/gyms/:gymId/setters',
        InjectAccountId,
        ValidateGymAdmin,
        SettersController.getSettersAtGym);

    app.get('/api/setters',
        InjectAccountId,
        SettersController.getUsers);

    app.post('/api/gyms/:gymId/setters/access',
        InjectAccountId,
        ValidateGymAdmin,
        SettersController.createSetterGymAccess);

    app.delete('/api/gyms/:gymId/setters/:setterId/access',
        InjectAccountId,
        ValidateGymAdmin,
        SettersController.deleteSetterGymAccess);





    // USERS
    app.get('/api/users/:userId/sends/:type',
        InjectAccountId,
        UsersController.getUserSendDistributions);

    app.get('/api/users/:userId/sends/boulder',
        InjectAccountId,
        UsersController.getBoulderSends);

    app.get('/api/users/:userId/sends/toprope',
        InjectAccountId,
        UsersController.getTopRopeSends);

    app.get('/api/users/:userId/sends/lead',
        InjectAccountId,
        UsersController.getLeadSends);

    app.get('/api/users/:userId/projects',
        InjectAccountId,
        ProjectsController.getProjectsForUser);

    app.get('/api/users/alerts',
        InjectAccountId,
        UsersController.getAlertsForUser);


    app.get('/api/users/:userId',
        InjectAccountId,
        UsersController.getUser);

    app.get('/api/users/:userId/image',
        InjectAccountId,
        UsersController.getUserImage);

    app.post('/api/users/homegym/set',
        InjectAccountId,
        UsersController.setHomeGym);

    app.get('/api/users/:userId/activity',
        InjectAccountId,
        UsersController.getActivityStream);

    app.get('/api/users/:userId/progressions',
        UsersController.getProgressions);





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





    // IMAGES
    app.post('/api/accounts/image',
        InjectAccountId,
        ImagesController.uploadAccountImage);

    // BLOG
    app.get('/api/blog',
        BlogController.getPosts);

    app.post('/api/blog',
        InjectAccountId,
        BlogController.createPost);

    app.post('/api/blog/:blogId',
        InjectAccountId,
        BlogController.updatePost);





    // GYM SUGGESTIONS
    app.post('/api/gyms/:gymId/suggestions/:suggestionId/read',
        InjectAccountId,
        ValidateGymAdmin,
        GymSuggestionsController.markAsRead);





    // ALERTS
    app.delete('/api/gyms/:gymId/alerts/:alertId',
        InjectAccountId,
        ValidateGymAdmin,
        AlertsController.deleteAlert);





    // GYM ACCOUNT REQUESTS
    app.post('/api/requests',
        GymAccountRequestsController.createGymAccountRequest);
};

module.exports = new RouteToControllerBinder();
