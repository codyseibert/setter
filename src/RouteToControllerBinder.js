/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var app = require('./SETTER');

var AccountsController = require('./controllers/Accounts');

var RouteToControllerBinder = function () {
    'use strict';

    // Example
    //app.post('/api/accounts/login', AccountsController.login);
};

module.exports = new RouteToControllerBinder();
