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


var Messages = require(helper('./Messages'));

// Unit under test
var GradesDao = rewire(helper('dao/GradesDao'));



describe('GradesDao', function () {

    describe('#getBoulderGrades', function () {

        var daoHelperSpy;

        beforeEach(function () {
            daoHelperSpy = sinon.spy();
        });

        it('invokes daoHelper getBoulderGrade method', function () {
            GradesDao.__set__({
                theDaoHelper: {
                    executeQuery: daoHelperSpy
                }
            });

            GradesDao.getBoulderGrades(null);

            assert(daoHelperSpy.calledOnce);
        });
    });

    describe('#getRopeGrades', function () {

        var daoHelperSpy;

        beforeEach(function () {
            daoHelperSpy = sinon.spy();
        });

        it('invokes daoHelper getRopeGrade method', function () {
            GradesDao.__set__({
                theDaoHelper: {
                    executeQuery: daoHelperSpy
                }
            });

            GradesDao.getRopeGrades(null);

            assert(daoHelperSpy.calledOnce);
        });
    });
});
