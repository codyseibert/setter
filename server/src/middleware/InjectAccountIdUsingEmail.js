var theAccountsDao = require('../dao/AccountsDao');
var theMessages = require('../Messages');

var InjectAccountIdUsingEmail = function (pReq, pRes, next) {
    'use strict';

    var email = pReq.body.email;

    theAccountsDao.getAccountIdUsingEmail(email, function (pResults) {
        if (pResults.error) {
            pRes.status(400);
            pRes.send(theMessages.error('No user found with that email'));
            return;
        }

        pReq.user = {
            accountId: pResults.id
        };

        return next();
    });
};

module.exports = InjectAccountIdUsingEmail;
