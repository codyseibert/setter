/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var db = require('../db');

var AccountsDAO = function () {
    'use strict';

    this.insertAccount = function (email, password, activation_key, firstname, lastname, access_key, admin_key, callback) {
        var query,
            values;

        query = "INSERT INTO accounts " +
            "(email, password, activation_key, firstname, lastname, access_key, admin_key, activated) " +
            "VALUES " +
            "(?, ?, ?, ?, ?, ?, ?, 1)";
        values = [email, password, activation_key, firstname, lastname, access_key, admin_key];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

    this.activateAccount = function (account_id, callback) {
        var query,
            values;
        query = "UPDATE accounts SET activated = true WHERE id = ?";
        values = [account_id];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

    this.updatePassword = function (account_id, password, callback) {
        var query,
            values;
        query = "UPDATE accounts SET password = ? WHERE id = ?";
        values = [password, account_id];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

    this.getAccountActivationKey = function (account_id, callback) {
        var query,
            values;
        query = "SELECT activation_key FROM accounts WHERE id = ?";
        values = [account_id];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

    this.getAccountKeys = function (account_id, callback) {
        var query,
            values;
        query = "SELECT access_key, admin_key FROM accounts WHERE id = ?";
        values = [account_id];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

    this.isEmailInUse = function (email, callback) {
        var query,
            values;
        query = "SELECT * FROM accounts WHERE email = ?";
        values = [email];
        db.query(query, values, function (err, results) {
            if (results.length <= 0) {
                callback(false);
            } else {
                callback(true);
            }
        });
    };

    this.getAccountId = function (email, password, callback) {
        var query,
            values;
        query = "SELECT id FROM accounts WHERE email = ? AND password = ?";
        values = [email, password];
        db.query(query, values, function (err, results) {
            if (err || results.length <= 0) {
                callback(undefined);
            } else {
                callback(results[0]);
            }
        });
    };

};

module.exports = new AccountsDAO();
