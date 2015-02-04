var theCrypt = require('../src/Crypt');
var theDB = require('../src/DBConnection');
var theMessages = require('../src/Messages');
var theDaoHelper = require('../src/dao/DaoHelper');
var randomstring = require('just.randomstring');

var USER_TYPE = 2;
var TOKEN = randomstring(20);

var EMAIL = "some_email@gmail.com";
var GYM_NAME = "Aiguille";
var ADDRESS = "999 Charles Street";
var PASSWORD = "some_random_password";


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
