/*jslint unparam: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var db = require('./db');
var ErrorMessage = require('./error');
var crypt = require('./Cryptography');

var Authorization = function () {
    'use strict';

    var decodeBase64,
        extractCreditials;

    decodeBase64 = function (base64) {
        var phrase,
            b64,
            b64_decoded,
            authArray;

        phrase = base64.split(' ')[1];
        b64 = new Buffer(phrase, 'base64');
        b64_decoded = b64.toString('ascii');
        authArray = b64_decoded.split(':');

        return {
            email: authArray[0],
            password: authArray[1]
        };
    };

    extractCreditials = function (req) {
        var auth,
            creditials;

        auth = req.headers.authorization;
        creditials = decodeBase64(auth);

        return creditials;
    };
};

module.exports = new Authorization();
