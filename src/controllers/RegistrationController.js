/*jslint nomen: true */
/*jslint unparam: true*/

/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theAccountsDao = require('../dao/AccountsDao');
var theUsersDao = require('../dao/UsersDao');
var theSettersDao = require('../dao/SettersDao');
var theGymsDao = require('../dao/GymsDao');

var theValidator = require('validator');

var Messages = require('../messages');

var theControllerHelper = require('./ControllerHelper');

var UsersController = function () {
    'use strict';

    var validateInputForAccount = function (pReq, pRes) {
        var body,
            email,
            password;

        body = pReq.body;
        email = body.email;
        password = body.password;

        if (!theValidator.isEmail(email)) {
            pRes.send(Messages.error('Invalid Email Format'));
            return;
        }

        if (!password || password.length < 6) {
            pRes.send(Messages.error('Password too short!'));
            return;
        }
    };

    this.registerUser = function (pReq, pRes) {
        var body,
            email,
            password,
            firstname,
            lastname,
            callback;

        body = pReq.body;
        email = body.email;
        password = body.password;
        firstname = body.firstname;
        lastname = body.lastname;

        validateInputForAccount(pReq, pRes);

        if (!firstname || firstname === '') {
            pRes.send(Messages.error('Please enter a first name!'));
            return;
        }

        if (!lastname || lastname === '') {
            pRes.send(Messages.error('Please enter a last name!'));
            return;
        }

        theAccountsDao.addAccount(email, password, function (results) {
            var accountId = results.insertId;
            callback = theControllerHelper.createDefaultCallback(pRes);
            theUsersDao.createUser(accountId, firstname, lastname, callback);
        });

    };

    this.registerSetter = function (pReq, pRes) {
        var firstname,
            lastname,
            callback;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.createUser(firstname, lastname, callback);
    };

    this.registerGym = function (pReq, pRes) {
        var firstname,
            lastname,
            callback;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.createUser(firstname, lastname, callback);
    };
};

module.exports = new UsersController();
