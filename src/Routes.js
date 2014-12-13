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
var InjectAccountId = require('./middleware/InjectAccountId');

var RouteToControllerBinder = function () {
    'use strict';

    app.post('/api/register/user',
        RegistrationController.registerUser);

    app.post('/api/register/gym',
        RegistrationController.registerGym);

    app.post('/api/login',
        LoginController.login);

    app.get('/api/gym/:gymId/walls',
        WallsController.getWallsInGym);

    app.post('/api/walls',
        InjectAccountId,
        WallsController.createWall);

    app.post('/api/walls/:wallId',
        InjectAccountId,
        WallsController.updateWall);

    app.delete('/api/walls/:wallId',
        InjectAccountId,
        WallsController.deleteWall);
};

module.exports = new RouteToControllerBinder();
