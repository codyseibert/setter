var theCrypt = require('../src/Crypt');
var theDB = require('../src/DBConnection');
var theMessages = require('../src/Messages');
var theDaoHelper = require('../src/dao/DaoHelper');
var randomstring = require('just.randomstring');

var USER_TYPE = 1;
var GYM_ID = 26;
var PASSWORD = "some_random_password";
var TOKEN = randomstring(20);

theCrypt.crypt(PASSWORD, function (err, hash) {
    var accountCreatedCallback = function (pResults) {
        theDaoHelper.executeQuery(
            'INSERT INTO users (account_id, gym_id, firstname, lastname) VALUES (?, ?, ?, ?)',
            [pResults.id, GYM_ID, 'Guest', 'Setter'],
            theDaoHelper.INSERT,
            function () { console.log("done"); }
        );
    };

    var email = 'some_guest_account_' + randomstring() + '@nothing.com';
    theDaoHelper.executeQuery(
        'INSERT INTO accounts (email, password, type_id, token) VALUES (?, ?, ?, ?)',
        [email, hash, USER_TYPE, TOKEN],
        theDaoHelper.INSERT,
        accountCreatedCallback
    );
});
