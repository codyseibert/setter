/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/


var bcrypt = require('bcrypt');

var Cryptography = function () {
    'use strict';

    this.encrypt = function (password, callback) {
        bcrypt.genSalt(10, function (err, salt) {
            if (err) {
                return callback(err);
            }
            bcrypt.hash(password, salt, function (err, hash) {
                return callback(err, hash);
            });
        });
    };

    this.validate = function (password, hash, callback) {
        bcrypt.compare(password, hash, function (err, isPasswordMatch) {
            if (err) {
                return callback(err);
            }
            return callback(null, isPasswordMatch);
        });
    };
};

module.exports = new Crypt();
