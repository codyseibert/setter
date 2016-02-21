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
var LoginHelper = function () {
    'use strict';

    this.sendToken = function (pAccountId, pRes) {
        theAccountsDao.getAccountInfo(pAccountId, function (pResults) {
            if (pResults.error) {
                pRes.status(400);
                pRes.send(theMessages.ERROR);
                return;
            }
            pRes.send({
                token: pResults.token,
                email: pResults.email,
                accountType: pResults.type_id,
                accountId: pAccountId,
                homeGymId: pResults.gym_id,
                gymName: pResults.name,
                url: pResults.url,
                fullname: pResults.fullname,
                gyms: pResults.gyms
            });
        });
    };

    this.generateAndSendToken = function (pAccountId, pRes) {
        var token = randomstring(20),
            that = this;

        theAccountsDao.setToken(pAccountId, token, function (pResults) {
            if (pResults.error) {
                pRes.status(400);
                pRes.send(theMessages.ERROR);
                return;
            }

            that.sendToken(pAccountId, pRes);
        });
    };
};

module.exports = new LoginHelper();
