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
mailer = require('../mailer'),
db = require('../db'),
auth = require('../auth'),
crypt = require('../crypt'),
accountsDao = require('../dao/accounts'),
accessDao = require('../dao/access'),

/**
*   Logic for all account requests
*
*   @Author Cody Seibert
*   @Date 12/7/2014
*/
Logic = function () {
    'use strict';

    // private methods
    var that = this,
    isValidPassword = function (password) {
        if (password.length < that.PASS_MIN) {
            return false;
        }
        return true;
    },

    createErrorMessage = function (error) {
        return {
            error: error
        };
    };

    // object build up
    this.PASS_MIN = 6;
    this.INVALID_LOGIN = createErrorMessage("Invalid Login");
    this.INVALID_PASSWORD_ERR = createErrorMessage("Password Too Short! (must be " + that.PASS_MIN + " characters)");
    this.INVALID_EMAIL_MSG = createErrorMessage("Invalid Email!");
    this.RESET_ERROR_MSG = createErrorMessage("Reset Error!");
    this.ACCOUNT_EXISTS_ERROR_MSG = createErrorMessage("Account Already Exists!");
    this.REG_ERROR_MSG = createErrorMessage("Registration Error!");
    this.UPDATE_ERROR_MSG = createErrorMessage("Update Error!");
    this.ACTIVATE_ERROR_MSG = createErrorMessage("Activate Error!");
    this.BAD_BETA_KEY = createErrorMessage("Bad Beta Key!");
    this.MISSING_NAME = createErrorMessage("Please enter your name!");
    this.SUCCESS_MSG = {};

    /**
    *   Checks if the user reqesting has valid auth
    *   Response returned
    *
    *   $method login
    *   $params login
    */
    this.login = function (pReq, pRes) {
        auth.getAccountId(pReq, pRes, function (pAccountId) {
            pRes.send(that.SUCCESS_MSG);
        });
    };









    this.getAccountKeys = function (req, res) {
        auth.getAccountId(req, res, function (account_id) {
            accountsDao.getAccountKeys(account_id, function (err, results) {
                // TODO shouldn't this return all the keys? not just one?
                res.send(results[0]);
            });
        });
    };










    this.postAccessKey = function (req, res) {
        auth.getAccountId(req, res, function (account_id) {
            var key = req.body.key;

            accessDao.isAccessKey(key, function (wall_account_id) {
                if (wall_account_id) {
                    accessDao.setAccessToAccountWalls(account_id, wall_account_id, 0, function (err, results) {
                        res.send("success");
                    });
                } else {
                    accessDao.isAdminKey(key, function (wall_account_id_admin) {
                        if (wall_account_id_admin) {
                            accessDao.setAccessToAccountWalls(account_id, wall_account_id_admin, 1, function (err, results) {
                                res.send("success");
                            });
                        } else {
                            res.send("invalid");
                        }
                    });
                }
            });
        });
    };


















    this.getAccessList = function (req, res) {
        auth.getAccountId(req, res, function (account_id) {
            accessDao.getAccessList(account_id, function (results) {
                res.send(results);
            });
        });
    };













    this.removeAccess = function (req, res) {
        var wall_account_id = req.body.wall_account_id;

        auth.getAccountId(req, res, function (account_id) {
            accessDao.removeAccess(account_id, wall_account_id, function (err, results) {
                if (err) {
                    res.send("error");
                } else {
                    res.send("success");
                }
            });
        });
    };














    this.resetPassword = function (req, res) {
        var body = req.body;
        auth.getAccountIdViaEmail(body.email, function (err, results) {
            var account_id,
            new_pass;

            account_id = results[0].id;
            new_pass = randomstring();

            crypt.crypt(new_pass, function (err, hash) {
                accountsDao.updatePassword(account_id, hash, function (err, results) {
                    mailer.mailResetPassword(body.email, new_pass);
                    res.send(that.SUCCESS_MSG);
                });
            });
        });
    };
















    this.registerAccount = function (req, res) {
        var account;

        account = req.body;
        if (!account.email || !validator.isEmail(account.email)) {
            res.send(that.INVALID_EMAIL_MSG);
            return;
        }

        if (!account.password || !isValidPassword(account.password)) {
            res.send(that.INVALID_PASSWORD_ERR);
            return;
        }

        if (!account.firstname || !account.lastname) {
            res.send(that.MISSING_NAME);
            return;
        }

        if (account.beta !== "aiguille") {
            res.send(that.BAD_BETA_KEY);
            return;
        }

        accountsDao.isEmailInUse(account.email, function (inUse) {
            if (inUse) {
                res.send(that.ACCOUNT_EXISTS_ERROR_MSG);
                return;
            }

            var activation_key,
            admin_key,
            access_key,
            removeIandJ;

            removeIandJ = function (string) {
                string = string.replace("i", "A");
                string = string.replace("I", "B");
                string = string.replace("l", "C");
                string = string.replace("L", "D");
                string = string.replace("0", "E");
                string = string.replace("O", "D");
                string = string.replace("o", "Q");
                return string;
            };

            activation_key = randomstring();
            admin_key = removeIandJ(randomstring(8));
            access_key = removeIandJ(randomstring(8));


            crypt.crypt(account.password, function (err, hash) {
                accountsDao.insertAccount(
                    account.email,
                    hash,
                    activation_key,
                    account.firstname,
                    account.lastname,
                    access_key,
                    admin_key,
                    function (err, results) {
                        var account_id = results.insertId;
                        /*
                        mailer.mailActivationCode(account_id,
                        account.email, activation_key);
                        */

                        // All new accounts should have admin access to all walls they post
                        accessDao.setAccessToAccountWalls(account_id, account_id, 1, function (err, results) {
                            res.send("success");
                        });
                    }
                );
            });
        });
    };















    this.changePassword = function (req, res) {
        var new_password;

        new_password = req.body.password;

        if (!isValidPassword(new_password)) {
            res.send(that.INVALID_PASSWORD_ERR);
            return;
        }

        auth.getAccountId(req, res, function (account_id) {
            accountsDao.updatePassword(account_id, new_password, function (err, results) {
                if (err) {
                    res.send(that.UPDATE_ERROR_MSG);
                } else {
                    res.send(that.SUCCESS_MSG);
                }
            });
        });
    };










    this.activateAccount = function (req, res) {
        var account_id,
        activation_key;

        account_id = req.params.account_id;
        activation_key = req.params.activation_key;
        accountsDao.getAccountActivationKey(account_id, function (err, results) {
            if (err || results.length <= 0) {
                res.send("Activate Error");
            } else {
                if (activation_key === results[0].activation_key) {
                    accountsDao.activateAccount(account_id, function (err, results) {
                        res.redirect('/#/activate');
                    });
                } else {
                    res.send("Invalid Activation Key!");
                }
            }
        });
    };
};

module.exports = new Logic();
