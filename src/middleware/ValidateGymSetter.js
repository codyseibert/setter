var theAccountsDao = require('../dao/AccountsDao');
var theSettersDao = require('../dao/SettersDao');
var theMessages = require('../Messages');

/**
    Always call InjectAccountId in the Routes.js before
    invoking this middleware!
*/
var ValidateGymSetter = function (pReq, pRes, next) {
    'use strict';

    var gymId = parseInt(pReq.params.gymId, 10);
    var userId = pReq.user.accountId;


    theAccountsDao.getGymAccessList(userId, function(data) {
        data = data.map(function(gym) { return gym.account_id; });
        if (gymId === pReq.user.accountId || data.indexOf(gymId) >= 0) {
          next()
        } else {
          pRes.status(400);
          pRes.send(theMessages.error('You are not authorized for this route!'));
          return;
        }

    });
};

module.exports = ValidateGymSetter;
