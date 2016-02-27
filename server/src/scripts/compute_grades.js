var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('../dao/DaoHelper');
var theUsersDao = require('../dao/UsersDao');

theDaoHelper.executeQuery(
    'SELECT account_id FROM users',
    [],
    theDaoHelper.MULTIPLE,
    function (pData) {
      for (var i = 0; i < pData.length; i++){
        var id = pData[i].account_id;

        var refreshBoulderingGrade = function (pUserId) {
          theUsersDao.computeBoulderGrade(pUserId, function (pData) {
            theUsersDao.setBoulderGrade(pUserId, pData.grade, function (pData) {
            });
          });
        };

        var refreshTopRopeGrade = function (pUserId) {
          theUsersDao.computeTopRopeGrade(pUserId, function (pData) {
            theUsersDao.setTopRopeGrade(pUserId, pData.grade, function (pData) {
            });
          });
        };

        var refreshLeadGrade = function (pUserId) {
          theUsersDao.computeLeadGrade(pUserId, function (pData) {
            theUsersDao.setLeadGrade(pUserId, pData.grade, function (pData) {
            });
          });
        };

        refreshBoulderingGrade(id);
        refreshTopRopeGrade(id);
        refreshLeadGrade(id);
      }
    }
);
