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
var SendsController = rewire(helper('controllers/SendsController'));


describe('SendsController', function () {
    describe('#getSendsForRoute', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            ROUTE_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    routeId: ROUTE_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SendsDao getSendsForRoute method', function () {
            SendsController.__set__({
                theSendsDao: {
                    getSendsForRoute: methodUnderTestSpy
                }
            });

            SendsController.getSendsForRoute(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedSendsInfo = [
                {
                    name: 'Send 1 name',
                    address: 'Send 1 address'
                },
                {
                    name: 'Send 2 name',
                    address: 'Send 2 address'
                }
            ];

            SendsController.__set__({
                theSendsDao: {
                    getSendsForRoute: function (pRouteId, pCallback) {
                        pCallback(expectedSendsInfo);
                    }
                }
            });

            SendsController.getSendsForRoute(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedSendsInfo);
        });
    });

    describe('#createSend', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            USER_ID = 1,
            ROUTE_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    accountId: USER_ID
                },
                params: {
                    routeId: ROUTE_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SendsDao createSend method with correct userId parameter', function () {
            SendsController.__set__({
                theSendsDao: {
                    createSend: methodUnderTestSpy
                }
            });

            SendsController.createSend(req, res);

            var userId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(userId, USER_ID);
        });

        it('invokes the SendsDao createSend method with correct routeId parameter', function () {
            SendsController.__set__({
                theSendsDao: {
                    createSend: methodUnderTestSpy
                }
            });

            SendsController.createSend(req, res);

            var routeId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(routeId, ROUTE_ID);
        });

        xit('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            SendsController.__set__({
                theSendsDao: {
                    createSend: function (pUserId, pRouteId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SendsController.createSend(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });

    describe('#deleteSend', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            ROUTE_ID = 1,
            USER_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    routeId: ROUTE_ID
                },
                user: {
                    accountId: USER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SendsDao deleteSend method with userId id', function () {
            var id;

            SendsController.__set__({
                theSendsDao: {
                    deleteSend: methodUnderTestSpy
                }
            });

            SendsController.deleteSend(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, USER_ID);
        });

        it('invokes the SendsDao deleteSend method with routeId id', function () {
            var id;

            SendsController.__set__({
                theSendsDao: {
                    deleteSend: methodUnderTestSpy
                }
            });

            SendsController.deleteSend(req, res);

            id = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(id, ROUTE_ID);
        });

        xit('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            SendsController.__set__({
                theSendsDao: {
                    deleteSend: function (pUserId, pRouteId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SendsController.deleteSend(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
