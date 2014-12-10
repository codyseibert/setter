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

var Messages = require('../Messages');

var theControllerHelper = require('./ControllerHelper');

var UsersController = function () {
    'use strict';

    var USER_TYPE = 1,
        SETTER_TYPE = 2,
        GYM_TYPE = 3,
        validateInputForAccount,
        validateInputForUserAndSetter;

    validateInputForAccount = function (pReq, pRes) {
        var body,
            email,
            password;

        body = pReq.body;
        email = body.email;
        password = body.password;

        if (!theValidator.isEmail(email)) {
            pRes.send(Messages.error('Invalid Email Format'));
            return false;
        }

        if (!password || password.length < 6) {
            pRes.send(Messages.error('Password too short!'));
            return false;
        }

        return true;
    };

    validateInputForUserAndSetter = function (pReq, pRes) {
        var body,
            firstname,
            lastname;

        body = pReq.body;
        firstname = body.firstname;
        lastname = body.lastname;

        if (!firstname || firstname === '') {
            pRes.send(Messages.error('Please enter a first name!'));
            return false;
        }

        if (!lastname || lastname === '') {
            pRes.send(Messages.error('Please enter a last name!'));
            return false;
        }

        return true;
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

        if (!validateInputForAccount(pReq, pRes)) {
            return;
        }

        if (!validateInputForUserAndSetter(pReq, pRes)) {
            return;
        }

        theAccountsDao.addAccount(email, password, USER_TYPE, function (results) {
            var accountId = results.insertId;
            callback = theControllerHelper.createDefaultCallback(pRes);
            theUsersDao.createUser(accountId, firstname, lastname, callback);
        });
    };

    this.registerSetter = function (pReq, pRes) {
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

        if (!validateInputForAccount(pReq, pRes)) {
            return;
        }

        if (!validateInputForUserAndSetter(pReq, pRes)) {
            return;
        }

        theAccountsDao.addAccount(email, password, SETTER_TYPE, function (results) {
            var accountId = results.insertId;
            callback = theControllerHelper.createDefaultCallback(pRes);
            theSettersDao.createSetter(accountId, firstname, lastname, callback);
        });
    };

    this.registerGym = function (pReq, pRes) {
        var body,
            name,
            email,
            password,
            address,
            callback;

        body = pReq.body;
        password = body.password;
        email = body.email;
        name = body.name;
        address = body.address;

        if (!validateInputForAccount(pReq, pRes)) {
            return;
        }

        if (!name || name === '') {
            pRes.send(Messages.error('Please enter the name of your gym!'));
            return;
        }

        if (!address || address === '') {
            pRes.send(Messages.error('Please enter the address of your gym!'));
            return;
        }

        theAccountsDao.addAccount(email, password, GYM_TYPE, function (results) {
            var accountId = results.insertId;
            callback = theControllerHelper.createDefaultCallback(pRes);
            theGymsDao.createGym(accountId, name, address, callback);
        });
    };
};

module.exports = new UsersController();
