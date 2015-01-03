/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var multer = require('multer');
var favicon = require('serve-favicon');
var logger = require('morgan');

var App = function () {
    'use strict';
    var app = express(),
        days2 = 86400000 * 2;

    app.use(bodyParser.json());
    app.use(cookieParser());
    app.use(multer({dest: __dirname + '/public/images/uploads'}));
    app.use(favicon(path.join(__dirname, 'public', 'images', 'favicon.ico')));

    if (process.env.SETTER_PRODUCTION) {
        app.use(express.static(__dirname + '/public', {maxAge: days2}));
    } else {
        app.use(express.static(__dirname + '/public'));
        app.use(logger('dev'));
    }

    return app;
};

module.exports = new App();
