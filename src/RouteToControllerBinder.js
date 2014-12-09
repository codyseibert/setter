/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var app = require('./app');

var routeController = require('./controllers/accounts');

var RouteToControllerBinder = function () {
    'use strict';

    // Example
    app.post('/api/accounts/login', routeController.login);
};

module.exports = new RouteToControllerBinder();
