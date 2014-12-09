/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

// REQUIRES
var randomstring = require('just.randomstring'),
    validator = require('validator'),
    mailer = require('../Mailer'),
    db = require('../DBConnection'),
    auth = require('../Authorization'),
    crypt = require('../Cryptography'),
    accountsDao = require('../dao/Accounts'),
    accessDao = require('../dao/Images'),

/**
*   Logic for all account requests
*
*   @Author Cody Seibert
*   @Date 12/7/2014
*/
AccountsController = function () {
    'use strict';

};

module.exports = new AccountsController();
