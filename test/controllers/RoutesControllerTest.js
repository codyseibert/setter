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
var RoutesController = rewire(helper('controllers/RoutesController'));


describe('RoutesController', function () {

    describe('#getRoute', function () {

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

        it('invokes the RoutesDao with expected gym id', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    getRoute: methodUnderTestSpy
                }
            });

            RoutesController.getRoute(req, res);

            var actualRouteId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(ROUTE_ID, actualRouteId);
        });

        it('sends expected data on success', function () {
            var SET_ID = 1,
                NAME = 'route awesome',
                SETTER_ID = 1,
                GRADE_ID = 1,
                COLOR_ID = 1,
                expectedRouteInfo = {
                    set_id: SET_ID,
                    name: NAME,
                    setter_id: SETTER_ID,
                    grade_id: GRADE_ID,
                    color_id: COLOR_ID
                };
            RoutesController.__set__({
                theRoutesDao: {
                    getRoute: function (pId, pCallback) {
                        pCallback(expectedRouteInfo);
                    }
                }
            });

            RoutesController.getRoute(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedRouteInfo);
        });
    });

    describe('#createRoute', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SET_ID = 1,
            NAME = 'route awesome',
            SETTER_ID = 1,
            GRADE_ID = 1,
            COLOR_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    setId: SET_ID
                },
                body: {
                    name: NAME,
                    setterId: SETTER_ID,
                    boulderGradeId: GRADE_ID,
                    ropeGradeId: GRADE_ID,
                    colorId: COLOR_ID,
                    note: ""
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RoutesDao createRoute method with correct set_id parameter', function () {
            assert(true);
        });
    });

    describe('#updateRoute', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            ROUTE_ID = 1,
            SET_ID = 1,
            NAME = 'route awesome',
            SETTER_ID = 1,
            GRADE_ID = 1,
            COLOR_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                body: {
                    name: NAME,
                    setterId: SETTER_ID,
                    boulderGradeId: GRADE_ID,
                    ropeGradeId: GRADE_ID,
                    colorId: COLOR_ID,
                    note: ""
                },
                params:{
                    routeId: ROUTE_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RoutesDao updateRoute method with correct route_id parameter', function () {
            assert(true);
        });
    });

    describe('#deleteRoute', function () {

        var sendSpy,
        methodUnderTestSpy,
        req,
        res,
        Route_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    routeId: Route_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RoutesDao deleteRoute method with expected id', function () {
            var id;

            RoutesController.__set__({
                theRoutesDao: {
                    deleteRoute: methodUnderTestSpy
                }
            });

            RoutesController.deleteRoute(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, Route_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            RoutesController.__set__({
                theRoutesDao: {
                    deleteRoute: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            RoutesController.deleteRoute(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
