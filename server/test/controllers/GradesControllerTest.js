/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/


// Requires
var helper = require('../require_helper');
var assert = require('assert');
var chai = require('chai');
var sinon = require('sinon');
var rewire = require('rewire');
global.expect = chai.expect;



// Unit under test
var GradesController = rewire(helper('controllers/GradesController'));



describe('GradesController', function () {

    describe('#getBoulderGrades', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {};
            res = {send: sendSpy};
        });

        it('invokes the GradesDao getBoulderGrades method', function () {
            GradesController.__set__({
                theGradesDao: {
                    getBoulderGrades: methodUnderTestSpy
                }
            });

            GradesController.getBoulderGrades(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends the same data returned from the GradesDao.getRopeGrades', function () {
            var expectedGradesSent = [
                {'id': 1, 'name': 'V0'},
                {'id': 2, 'name': 'V2'},
                {'id': 6, 'name': 'V3'}
            ];
            GradesController.__set__({
                theGradesDao: {
                    getBoulderGrades: function (pCallback) {
                        pCallback(expectedGradesSent);
                    }
                }
            });

            GradesController.getBoulderGrades(req, res);

            var actualGradesSent = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualGradesSent, expectedGradesSent);
        });
    });

    describe('#getRopeGrades', function () {
        var sendSpy,
            methodUnderTestSpy,
            req,
            res;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {};
            res = {send: sendSpy};
        });

        it('invokes the GradesDao getBoulderGrades method', function () {
            GradesController.__set__({
                theGradesDao: {
                    getRopeGrades: methodUnderTestSpy
                }
            });

            GradesController.getRopeGrades(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends the same data returned from the GradesDao.getBoulderGrades', function () {
            var expectedGradesSent = [
                {'id': 1, 'name': '5.10'},
                {'id': 2, 'name': '5.11'},
                {'id': 3, 'name': '5.12'}
            ];
            GradesController.__set__({
                theGradesDao: {
                    getRopeGrades: function (pCallback) {
                        pCallback(expectedGradesSent);
                    }
                }
            });

            GradesController.getRopeGrades(req, res);

            var actualGradesSent = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualGradesSent, expectedGradesSent);
        });
    });
});
