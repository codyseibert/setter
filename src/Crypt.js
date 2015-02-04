/*jslint nomen: true */
var bcrypt = require('bcrypt-nodejs');

var Crypt = function () {
    'use strict';

    this.crypt = function (password, callback) {
        bcrypt.genSalt(10, function (err, salt) {
            if (err) {
                return callback(err);
            }
            bcrypt.hash(password, salt, null, function (err, hash) {
                return callback(err, hash);
            });
        });
    };

    this.check = function (password, hash, callback) {
        bcrypt.compare(password, hash, function (err, isPasswordMatch) {
            if (err) {
                return callback(err);
            }
            return callback(null, isPasswordMatch);
        });
    };
};

module.exports = new Crypt();
