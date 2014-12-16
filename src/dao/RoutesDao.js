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

    this.getRoute = function (pRouteId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.name AS route_name, r.setter_id, r.boulder_grade_id, r.rope_grade_id, r.color_id, bg.name AS boulder_grade, rg.name AS rope_grade, c.name AS color, c.value AS value, u.firstname, u.lastname, r.date FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.rope_grade_id = rg.id ' +
                'WHERE r.id = ?',
            [pRouteId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    this.getRoutesInSet = function (pSetId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT r.id, r.name AS route_name, bg.name AS boulder_grade, rg.name AS rope_grade, c.name AS color, c.value AS value, u.firstname, u.lastname, r.date FROM routes r ' +
                'INNER JOIN users u ON r.setter_id = u.account_id ' +
                'INNER JOIN colors c ON r.color_id = c.id ' +
                'LEFT JOIN boulder_grades bg ON r.boulder_grade_id = bg.id ' +
                'LEFT JOIN rope_grades rg ON r.rope_grade_id = rg.id ' +
                'WHERE r.set_id = ?',
            [pSetId],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    this.createRoute = function (pSetId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO routes (set_id, name, setter_id, boulder_grade_id, rope_grade_id, color_id, note, date) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())',
            [pSetId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateRoute = function (pRouteId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote, pCallback) {
        console.log(pRouteId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote);
        theDaoHelper.executeQuery(
            'UPDATE routes SET name = ?, setter_id = ?, boulder_grade_id = ?, rope_grade_id = ?, color_id = ?, note = ? WHERE id = ?',
            [pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote, pRouteId],
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
