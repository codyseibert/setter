/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var nodemailer = require('nodemailer');

var Mailer = function () {
    'use strict';

    var transport,
        from_email;

    transport = nodemailer.createTransport();

    from_email = 'accounts@setter.app';

    // For injecting mock during testing
    this.setTransport = function (tran) {
        transport = tran;
    };

    this.mailResetPassword = function (email, new_password) {
        transport.sendMail({
            from: from_email,
            to: email,
            subject: 'Password Reset at SETTER',
            text: 'You have requested your password to be reset.  Your new password is ' + new_password,
            html: 'You have requested your password to be reset.  Your new password is <b>' + new_password + '</b>.  You can now log in using that password at <a href="http://setter.rocks/#/login">http://setter.rocks/#/login</a>'
        });
    };

    this.mailActivationCode = function (account_id, email, code) {
        var activation_url = 'http://setter.rocks/api/accounts/' + account_id + '/activate/' + code;

        transport.sendMail({
            from: from_email,
            to: email,
            subject: 'Account Activation at SETTER',
            text: 'Thank you for creating your account at SETTER!  Please go to the following link to activate your account: ' + activation_url,
            html: 'Thank you for creating your account at SETTER!  Please go to the following link to activate your account: <a href="' + activation_url + '">' + activation_url + '</a>'
        });
    };
};

module.exports = new Mailer();
