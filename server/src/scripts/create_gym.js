var theCrypt = require('../Crypt');
var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');
var randomstring = require('just.randomstring');

var USER_TYPE = 2;
var TOKEN = randomstring(20);

var EMAIL = "blank@gmail.com";
var GYM_NAME = "Boulder Rock Club";
var ADDRESS = "2829 Mapleton Avenue, Boulder, CO 80301";
var PASSWORD = "poopoo";

theCrypt.crypt(PASSWORD, function (err, hash) {

    var accountCreatedCallback = function (pResults) {
        theDaoHelper.executeQuery(
            'INSERT INTO gyms (account_id, name, address) VALUES (?, ?, ?)',
            [pResults.id, GYM_NAME, ADDRESS],
            theDaoHelper.INSERT,
            function () { console.log("done"); }
        );
    };

    theDaoHelper.executeQuery(
        'INSERT INTO accounts (email, password, type_id, token) VALUES (?, ?, ?, ?)',
        [EMAIL, hash, USER_TYPE, TOKEN],
        theDaoHelper.INSERT,
        accountCreatedCallback
    );

});
