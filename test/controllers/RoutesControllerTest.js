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
                    id: ROUTE_ID
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






    describe('#getRoutesInSet', function () {

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

        it('invokes the RoutesDao getRoutesInSet method', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    getRoutesInSet: methodUnderTestSpy
                }
            });

            RoutesController.getRoutesInSet(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedRoutesInfo = ['a', 'b', 'c'];

            RoutesController.__set__({
                theRoutesDao: {
                    getRoutesInSet: function (pId, pCallback) {
                        pCallback(expectedRoutesInfo);
                    }
                }
            });

            RoutesController.getRoutesInSet(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedRoutesInfo);
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
                body: {
                    set_id: SET_ID,
                    name: NAME,
                    setter_id: SETTER_ID,
                    grade_id: GRADE_ID,
                    color_id: COLOR_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RoutesDao createRoute method with correct set_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: methodUnderTestSpy
                }
            });

            RoutesController.createRoute(req, res);

            var setId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(setId, SET_ID);
        });

        it('invokes the RoutesDao createRoute method with correct address parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: methodUnderTestSpy
                }
            });

            RoutesController.createRoute(req, res);

            var name = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(name, NAME);
        });

        it('invokes the RoutesDao createRoute method with correct setter_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: methodUnderTestSpy
                }
            });

            RoutesController.createRoute(req, res);

            var setterId = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(setterId, SETTER_ID);
        });

        it('invokes the RoutesDao createRoute method with correct grade_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: methodUnderTestSpy
                }
            });

            RoutesController.createRoute(req, res);

            var gradeId = methodUnderTestSpy.getCall(0).args[3];
            assert.equal(gradeId, GRADE_ID);
        });

        it('invokes the RoutesDao createRoute method with correct color_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: methodUnderTestSpy
                }
            });

            RoutesController.createRoute(req, res);

            var colorId = methodUnderTestSpy.getCall(0).args[4];
            assert.equal(colorId, COLOR_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            RoutesController.__set__({
                theRoutesDao: {
                    createRoute: function (pSetId, pName, pSetterId, pGradeId, pColorId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            RoutesController.createRoute(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
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
                    set_id: SET_ID,
                    name: NAME,
                    setter_id: SETTER_ID,
                    grade_id: GRADE_ID,
                    color_id: COLOR_ID
                },
                params:{
                    id: ROUTE_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RoutesDao updateRoute method with correct route_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var routeId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(routeId, ROUTE_ID);
        });

        it('invokes the RoutesDao updateRoute method with correct set_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var setId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(setId, SET_ID);
        });

        it('invokes the RoutesDao updateRoute method with correct name parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var name = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(name, NAME);
        });

        it('invokes the RoutesDao updateRoute method with correct setter_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var setterId = methodUnderTestSpy.getCall(0).args[3];
            assert.equal(setterId, SETTER_ID);
        });

        it('invokes the RoutesDao updateRoute method with correct grade_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var gradeId = methodUnderTestSpy.getCall(0).args[4];
            assert.equal(gradeId, GRADE_ID);
        });

        it('invokes the RoutesDao updateRoute method with correct color_id parameter', function () {
            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: methodUnderTestSpy
                }
            });

            RoutesController.updateRoute(req, res);

            var colorId = methodUnderTestSpy.getCall(0).args[5];
            assert.equal(colorId, COLOR_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            RoutesController.__set__({
                theRoutesDao: {
                    updateRoute: function (pId, pSetId, pName, pSetterId, pGradeId, pColorId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            RoutesController.updateRoute(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
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
                    id: Route_ID
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
