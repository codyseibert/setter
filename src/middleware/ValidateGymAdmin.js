var theAccountsDao = require('../dao/AccountsDao');
var theMessages = require('../Messages');

/**
    Always call InjectAccountId in the Routes.js before
    invoking this middleware!
*/
var ValidateGymAdmin = function (pReq, pRes, next) {
    'use strict';

    var gymId = parseInt(pReq.params.gymId, 10);

    // TODO:
    // in the future do query against database to check if the userId is a
    // valid setter once we start adding that functionality in.

    if (gymId !== pReq.user.accountId) {
        pRes.status(400);
        pRes.send(theMessages.error('You are not authorized for this route!'));
        return;
    }

    next();
};

module.exports = ValidateGymAdmin;
