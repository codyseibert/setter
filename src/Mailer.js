var nodemailer = require('nodemailer');

var Mailer = function () {
    'use strict';

    var transport,
        fromEmail;

    transport = nodemailer.createTransport();

    fromEmail = 'accounts@setter.rocks';

    this.mailResetPassword = function (pEmail, pPassword) {
        transport.sendMail({
            from: fromEmail,
            to: pEmail,
            subject: 'Password reset at setter.rocks',
            text: 'You have requested your password to be reset.  Your new password is ' + pPassword,
            html: 'You have requested your password to be reset.  Your new password is <b>' + pPassword + '</b>.  You can now log in using that password at <a href="http://setter.rocks/#/login">http://setter.rocks/#/login</a>'
        });
    };
};

module.exports = new Mailer();
