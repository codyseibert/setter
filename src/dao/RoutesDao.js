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
            'SELECT r.id, r.name, r.grade_id, g.grade, r.color_id, c.value, s.firstname, s.lastname, r.date, r.note FROM routes r ' +
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
            //r.name, r.grade_id, bg.name, rg.name, r.color_id, c.value, a.id AS setter_id, a.firstname, a.lastname, r.date, r.note
            'SELECT r.id FROM routes r ' +
                'INNER JOIN accounts a ON r.setter_id = a.id ' +
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
        console.log(pSetId);
        console.log(pName);
        console.log(pSetterId);
        console.log(pBoulderGradeId);
        console.log(pRopeGradeId);
        console.log(pColorId);
        console.log(pNote);

        theDaoHelper.executeQuery(
            'INSERT INTO routes (set_id, name, setter_id, boulder_grade_id, rope_grade_id, color_id, note, date) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())',
            [pSetId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    this.updateRoute = function (pId, pSetId, pName, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE routes SET name = ? AND set_id = ? AND setter_id = ? AND boulder_grade_id = ? AND rope_grade_id = ? AND color_id = ? AND note = ? WHERE id = ?',
            [pName, pSetId, pSetterId, pBoulderGradeId, pRopeGradeId, pColorId, pNote, pId],
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
