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
            password,
            token;
        body = pReq.body;
        email = body.email;
        password = body.password;
        token = randomstring(20);

        theAccountsDao.getAccountId(email, password, function (pResults) {
            console.log(pResults);
            if (pResults === theMessages.ERROR) {
                pRes.send(pResults);
                return;
            }
            var accountId = pResults[0].id;
            theAccountsDao.setToken(accountId, token, function (pResults) {
                if (pResults === theMessages.ERROR) {
                    pRes.send(pResults);
                    return;
                }

                pRes.send(token);
            });
        });
    }
};

module.exports = new LoginController();
