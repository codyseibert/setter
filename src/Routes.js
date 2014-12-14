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

    // SETS
    app.get('/api/walls/:wallId/sets',
        InjectAccountId,
        SetsController.getSetsOnWall);

    app.post('/api/walls/:wallId/sets',
        InjectAccountId,
        SetsController.createSet);

    app.delete('/api/walls/:wallId',
        InjectAccountId,
        WallsController.deleteWall);

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
};

module.exports = new RouteToControllerBinder();
