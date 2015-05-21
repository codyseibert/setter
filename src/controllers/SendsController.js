/*jslint nomen: true */
/*jslint unparam: true*/

/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theSendsDao = require('../dao/SendsDao');
var theRoutesDao = require('../dao/RoutesDao');
var theUsersDao = require('../dao/UsersDao');
var theControllerHelper = require('./ControllerHelper');

var SendsController = function () {
    'use strict';

    this.getSendsForRoute = function (pReq, pRes) {
        var routeId,
            callback;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.getSendsForRoute(routeId, callback);
    };

    this.hasSent = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        routeId = pReq.params.routeId;
        userId = pReq.user.accountId;
        callback = theControllerHelper.createNoStatusDefaultCallback(pRes);
        theSendsDao.hasSent(userId, routeId, callback);
    };

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

    var refreshGrades = function (pUserId, pRouteId) {
      theRoutesDao.getRoute(pRouteId, function (pData) {
          if (pData.boulder_grade_id) {
            refreshBoulderingGrade(pUserId);
          } else if (pData.toprope_grade_id) {
            refreshTopRopeGrade(pUserId);
          } else if (pData.lead_grade_id) {
            refreshLeadGrade(pUserId);
          }
      });
    };

    this.createSend = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.createSend(userId, routeId, function (pData) {
          refreshGrades(userId, routeId);
          callback(pData);
        });
    };

    this.deleteSend = function (pReq, pRes) {
        var userId,
            routeId,
            callback;
        userId = pReq.user.accountId;
        routeId = pReq.params.routeId;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theSendsDao.deleteSend(userId, routeId, function (pData) {
          refreshGrades(userId, routeId);
          callback(pData);
        });
    };
};

module.exports = new SendsController();
