var theAccountsDao = require('../dao/AccountsDao');
var theMessages = require('../Messages');

var InjectAccountId = function (pReq, pRes, next) {
    'use strict';

    if (!pReq.headers.authorization && !pReq.body.authorization) {
        pRes.status(400);
        pRes.send(theMessages.error('Bearer token not found in request!'));
        return;
    }

    var headers,
        split,
        token;

    headers = pReq.headers.authorization || pReq.body.authorization;
    split = headers.split(' ');

    if (split.length <= 1) {
        pRes.status(400);
        pRes.send(theMessages.error('Bearer token has invalid format!'));
        return;
    }

    token = split[1];

    theAccountsDao.getAccountIdViaToken(token, function (pAccountId) {
        if (pAccountId.error) {
            pRes.status(400);
            pRes.send(theMessages.error('Invalid Bearer Token!'));
            return;
        }

        pReq.user = {
            accountId: pAccountId.id
        };

        return next();
    });
};

module.exports = InjectAccountId;
