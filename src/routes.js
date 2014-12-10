/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var app = require('./app');

var GradesController = require('./controllers/GradesController');
var GymsController = require('./controllers/GymsController');

var RouteToControllerBinder = function () {
    'use strict';
    app.get('/api/grades/boulder', GradesController.getBoulderGrades);
    app.get('/api/grades/rope', GradesController.getRopeGrades);

    app.get('/api/gyms', GymsController.getGyms);
    app.get('/api/gyms/:id', GymsController.getGym);
    app.post('/api/gyms/:id', GymsController.updateGym);
    app.post('/api/gyms', GymsController.createGym);
    app.delete('/api/gyms/:id', GymsController.deleteGym);
};

module.exports = new RouteToControllerBinder();
