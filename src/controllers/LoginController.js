/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

// REQUIRES
var randomstring = require('just.randomstring');
var theAccountsDao = require('../dao/AccountsDao');
var theMessages = require('../Messages');
var theLoginHelper = require('./LoginHelper');
var theCrypt = require('../Crypt');

/**
*   Logic for all account requests
*
*   @Author Cody Seibert
*   @Date 12/7/2014
*/
var LoginController = function () {
    'use strict';

    this.login = function (pReq, pRes) {
        var body,
            email,
            password;
        body = pReq.body;
        email = body.email;
        password = body.password;

        theAccountsDao.getAccountId(email, function (pResults) {
            if (pResults.error) {
                pRes.status(400);
                pRes.send(pResults);
                return;
            }

            theCrypt.check(password, pResults.password, function (err, matches) {
                if (matches) {
                    theLoginHelper.sendToken(pResults.id, pRes);
                } else {
                    pRes.status(400);
                    pRes.send(theMessages.error("Invalid Login!"));
                }
            });

        });
    };
};

module.exports = new LoginController();
