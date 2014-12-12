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

var theUsersDao = require('../dao/UsersDao');
var theControllerHelper = require('./ControllerHelper');

var UsersController = function () {
    'use strict';

    this.getUser = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getUser(id, callback);
    };

    this.getUsers = function (pReq, pRes) {
        var callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.getUsers(callback);
    };

    this.createUser = function (pReq, pRes) {
        var firstname,
            lastname,
            callback;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.createUser(firstname, lastname, callback);
    };

    this.updateUser = function (pReq, pRes) {
        var id,
            firstname,
            lastname,
            callback;
        id = pReq.params.id;
        firstname = pReq.body.firstname;
        lastname = pReq.body.lastname;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.updateUser(id, firstname, lastname, callback);
    };

    this.deleteUser = function (pReq, pRes) {
        var id,
            callback;
        id = pReq.params.id;
        callback = theControllerHelper.createDefaultCallback(pRes);
        theUsersDao.deleteUser(id, callback);
    };
};

module.exports = new UsersController();
