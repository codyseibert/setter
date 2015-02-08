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
var theCrypt = require('../Crypt');
var theLoginHelper = require('./LoginHelper');
var Messages = require('../Messages');
var theControllerHelper = require('./ControllerHelper');
var ChangeCase = require('change-case');

var UsersController = function () {
    'use strict';

    var USER_TYPE = 1,
        GYM_TYPE = 2,
        validateInputForAccount;

    validateInputForAccount = function (pReq, pRes) {
        var body,
            email,
            password;

        body = pReq.body;
        email = body.email;
        password = body.password;

        if (!theValidator.isEmail(email)) {
            pRes.status(400);
            pRes.send(Messages.error('Invalid Email Format'));
            return false;
        }

        if (!password || password.length < 6) {
            pRes.status(400);
            pRes.send(Messages.error('Password too short!'));
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
            gymId,
            callback;

        body = pReq.body;
        email = body.email;
        password = body.password;
        firstname = body.firstname;
        lastname = body.lastname;
        gymId = pReq.body.gym_id;

        if (!validateInputForAccount(pReq, pRes)) {
            return;
        }

        if (!firstname || firstname === '') {
            pRes.status(400);
            pRes.send(Messages.error('Please enter a first name!'));
            return false;
        }

        if (!lastname || lastname === '') {
            pRes.status(400);
            pRes.send(Messages.error('Please enter a last name!'));
            return false;
        }

        firstname = ChangeCase.titleCase(firstname);
        lastname = ChangeCase.titleCase(lastname);

        theCrypt.crypt(password, function (err, hash) {
            theAccountsDao.createAccount(email, hash, USER_TYPE, function (pResults) {
                var accountId = pResults.id;
                callback = function (pData) {
                    theLoginHelper.generateAndSendToken(accountId, pRes);
                };
                theUsersDao.createUser(accountId, firstname, lastname, gymId, callback);
            });
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
            pRes.status(400);
            pRes.send(Messages.error('Please enter the name of your gym!'));
            return;
        }

        if (!address || address === '') {
            pRes.status(400);
            pRes.send(Messages.error('Please enter the address of your gym!'));
            return;
        }

        theCrypt.crypt(password, function (err, hash) {
            theAccountsDao.createAccount(email, hash, GYM_TYPE, function (pResults) {
                var accountId = pResults.id;
                callback = function (pData) {
                    theLoginHelper.generateAndSendToken(accountId, pRes);
                };
                theGymsDao.createGym(accountId, name, address, callback);
            });
        });
    };
};

module.exports = new UsersController();
