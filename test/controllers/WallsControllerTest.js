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
var WallsController = rewire(helper('controllers/WallsController'));


describe('WallsController', function () {

    describe('#getWallsInGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    gymId: 2
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the WallsDao getWalls method', function () {
            WallsController.__set__({
                theWallsDao: {
                    getWallsInGym: methodUnderTestSpy
                }
            });

            WallsController.getWallsInGym(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedWallsInfo = [
                {
                    firstname: 'cody',
                    lastname: 'seibert'
                }
            ];

            WallsController.__set__({
                theWallsDao: {
                    getWallsInGym: function (pGymId, pCallback) {
                        pCallback(expectedWallsInfo);
                    }
                }
            });

            WallsController.getWallsInGym(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedWallsInfo);
        });
    });

    describe('#createWall', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            NAME = 'cody',
            GYM_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                body: {
                    wallName: NAME
                },
                user: {
                    accountId: GYM_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the WallsDao createWall method with correct name parameter', function () {
            WallsController.__set__({
                theWallsDao: {
                    createWall: methodUnderTestSpy
                }
            });

            WallsController.createWall(req, res);

            var name = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(name, NAME);
        });

        it('invokes the WallsDao createWall method with correct gym_id parameter', function () {
            WallsController.__set__({
                theWallsDao: {
                    createWall: methodUnderTestSpy
                }
            });

            WallsController.createWall(req, res);

            var gymId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(gymId, GYM_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            WallsController.__set__({
                theWallsDao: {
                    createWall: function (pName, pGymId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            WallsController.createWall(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });

    describe('#updateWall', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            NAME = 'cody',
            WALL_ID = 2,
            ACCOUNT_ID = 4;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    accountId: ACCOUNT_ID
                },
                params: {
                    wallId: WALL_ID
                },
                body: {
                    wallName: NAME
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the WallsDao updateWall method with expected id', function () {
            var wallId;

            WallsController.__set__({
                theWallsDao: {
                    updateWall: methodUnderTestSpy
                }
            });

            WallsController.updateWall(req, res);

            wallId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(wallId, WALL_ID);
        });

        it('invokes the WallsDao updateWall method with expected name', function () {
            var name;

            WallsController.__set__({
                theWallsDao: {
                    updateWall: methodUnderTestSpy
                }
            });

            WallsController.updateWall(req, res);

            name = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(name, NAME);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
                actualData;

            WallsController.__set__({
                theWallsDao: {
                    updateWall: function (pWallId, pAccountId, pName, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            WallsController.updateWall(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });

    describe('#deleteWall', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            WALL_ID = 1,
            ACCOUNT_ID = 4;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    accountId: ACCOUNT_ID
                },
                params: {
                    wallId: WALL_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the WallsDao deleteWall method with expected id', function () {
            var wallId;

            WallsController.__set__({
                theWallsDao: {
                    deleteWall: methodUnderTestSpy
                }
            });

            WallsController.deleteWall(req, res);

            wallId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(wallId, WALL_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            WallsController.__set__({
                theWallsDao: {
                    deleteWall: function (pAccountId, pWallId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            WallsController.deleteWall(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
