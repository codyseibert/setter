var theCrypt = require('../Crypt');
var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');
var randomstring = require('just.randomstring');

var USER_TYPE = 1;
var GYM_ID = 2;
var PASSWORD = "some_random_password";
var TOKEN = randomstring(20);

theCrypt.crypt(PASSWORD, function (err, hash) {

    var userCreatedCallback = function (pResults) {
        theDaoHelper.executeQuery(
            'INSERT INTO setters_gyms_access (setter_id, gym_id) VALUES (?, ?)',
            [pResults.id, GYM_ID],
            theDaoHelper.INSERT,
            function () {
                console.log('done');
            }
        );
    }

    var accountCreatedCallback = function (pResults) {
        theDaoHelper.executeQuery(
            'INSERT INTO users (account_id, gym_id, firstname, lastname) VALUES (?, ?, ?, ?)',
            [pResults.id, GYM_ID, 'Guest', 'Setter'],
            theDaoHelper.INSERT,
            function (r) {
                userCreatedCallback(pResults);
            }
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
