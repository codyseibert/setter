/*jslint nomen: true */

/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('./DaoHelper');

/**
    RoutesDao

    Contains logic related to Routes.
*/
var RoutesDao = function () {
    'use strict';

    this.getRoute = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.name, r.grade_id, g.grade, r.color_id, c.value, s.firstname, s.lastname, r.date FROM routes r ' +
                'INNER JOIN setters s ON r.setter_id = s.id ' +
                'INNER JOIN grades g ON r.grade_id = g.id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'WHERE r.id = ?',
            [pId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getRoutesInSet = function (pSetId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.name, r.grade_id, g.grade, r.color_id, c.value, s.firstname, s.lastname, r.date FROM routes r ' +
                'INNER JOIN setters s ON r.setter_id = s.id ' +
                'INNER JOIN grades g ON r.grade_id = g.id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'WHERE r.set_id = ?',
            [pSetId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createRoute = function (pSetId, pName, pSetterId, pGradeId, pColorId, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO routes (set_id, name, setter_id, grade_id, color_id) VALUES (?, ?, ?, ?, ?)',
            [pSetId, pName, pSetterId, pGradeId, pColorId],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateRoute = function (pId, pSetId, pName, pSetterId, pGradeId, pColorId, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE routes SET name = ? AND set_id = ? AND setter_id = ? AND grade_id = ? AND color_id = ? WHERE id = ?',
            [pName, pSetId, pSetterId, pGradeId, pColorId, pId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    this.deleteRoute = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM routes WHERE id = ?',
            [pId],
            theDaoHelper.DELETE,
            pCallback
        );
    };
};

module.exports = new RoutesDao();
