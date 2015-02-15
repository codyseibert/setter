var theCrypt = require('../Crypt');
var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');
var randomstring = require('just.randomstring');

var USER_TYPE = 2;
var TOKEN = randomstring(20);

var EMAIL = "info@x-tremerock.com";
var GYM_NAME = "X-Treme";
var ADDRESS = "13972 SW 139 Court, Miami, FL 33186";
var PASSWORD = "helloxtreme";

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
