var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');

theDaoHelper.executeQuery(
    'SELECT account_id FROM users',
    [],
    theDaoHelper.MULTIPLE,
    function (pData) {
      console.log(pData);
    }
);
