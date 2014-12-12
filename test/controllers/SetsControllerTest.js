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
var SetsController = rewire(helper('controllers/SetsController'));


describe('SetsController', function () {

    describe('#getSets', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: id
            };
            res = {send: sendSpy};
        });

        it('invokes the SetsDao getSets method', function () {
            SetsController.__set__({
                theSetsDao: {
                    getSets: methodUnderTestSpy
                }
            });

            SetsController.getSets(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedSetsInfo = [
                {
                    firstname: 'cody',
                    lastname: 'seibert'
                }
            ];

            SetsController.__set__({
                theSetsDao: {
                    getSets: function (pWallId, pCallback) {
                        pCallback(expectedSetsInfo);
                    }
                }
            });

            SetsController.getSets(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedSetsInfo);
        });
    });






    describe('#createSet', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            WALL_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: WALL_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SetsDao createSet method with correct wallId parameter', function () {
            SetsController.__set__({
                theSetsDao: {
                    createSet: methodUnderTestSpy
                }
            });

            SetsController.createSet(req, res);

            var id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, WALL_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            SetsController.__set__({
                theSetsDao: {
                    createSet: function (pWallId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SetsController.createSet(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });



















    describe('#deleteSet', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SET_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: SET_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SetsDao deleteSet method with expected id', function () {
            var id;

            SetsController.__set__({
                theSetsDao: {
                    deleteSet: methodUnderTestSpy
                }
            });

            SetsController.deleteSet(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, SET_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            SetsController.__set__({
                theSetsDao: {
                    deleteSet: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SetsController.deleteSet(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
