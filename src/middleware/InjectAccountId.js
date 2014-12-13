var theAccountsDao = require('../dao/AccountsDao');
var Messages = require('../Messages');

var InjectAccountId = function (pReq, pRes, next) {
    'use strict';

    if (!pReq.headers.authorization) {
        pRes.send('Bearer token not found in request!');
        return;
    }

    var headers,
        split,
        token;

    headers = pReq.headers.authorization;
    split = headers.split(' ');

    if (split.length <= 1) {
        pRes.send('Bearer token has invalid format!');
        return;
    }

    token = split[1];

    theAccountsDao.getAccountIdViaToken(token, function (pAccountId) {
        if (pAccountId.error) {
            pReq.user = {
                accountId: pAccountId.id
            };
            return next();
        }
    });
};

module.exports = InjectAccountId;
