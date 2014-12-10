/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var app = require('./app');

var GradesController = require('./controllers/GradesController');

var RouteToControllerBinder = function () {
    'use strict';
    app.get('/api/grades/boulder', GradesController.getBoulderGrades);
    app.get('/api/grades/rope', GradesController.getRopeGrades);
};

module.exports = new RouteToControllerBinder();
