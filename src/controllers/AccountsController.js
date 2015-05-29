/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theCrypt = require('../Crypt');
var theAccountsDao = require('../dao/AccountsDao');
var randomstring = require('just.randomstring');
var theMailer = require('../Mailer');
var theControllerHelper = require('./ControllerHelper');

var AccountsController = function () {
    'use strict';

    this.mailNewPassword = function (pReq, pRes) {
        var accountId,
            newPassword;

        accountId = pReq.user.accountId;
        newPassword = randomstring();
        theCrypt.crypt(newPassword, function (pErr, pHash) {
            theAccountsDao.updatePassword(accountId, pHash, function (pErr, pResults) {
                theMailer.mailResetPassword(pReq.body.email, newPassword);
                pRes.send(pResults);
            });
        });
    };

    this.changePassword = function (pReq, pRes) {
        var accountId,
            newPassword;

        accountId = pReq.user.accountId;
        newPassword = pReq.body.password;

        theCrypt.crypt(newPassword, function (pErr, pHash) {
            theAccountsDao.updatePassword(accountId, pHash, function (pErr, pResults) {
                pRes.send(pResults);
            });
        });
    };

    this.getSettings = function (pReq, pRes) {
        var accountId,
            callback;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theAccountsDao.getSettings(accountId, callback);
    };

    this.updateSettings = function (pReq, pRes) {
        var accountId,
            settings,
            callback;
        accountId = pReq.user.accountId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        settings = pReq.body;
        theAccountsDao.updateSettings(accountId, settings, callback);
    };
};

module.exports = new AccountsController();
