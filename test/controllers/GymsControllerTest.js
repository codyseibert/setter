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
var GymsController = rewire(helper('controllers/GymsController'));


describe('GymsController', function () {

    describe('#getGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: GYM_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the GymsDao with expected gym id', function () {
            GymsController.__set__({
                theGymsDao: {
                    getGym: methodUnderTestSpy
                }
            });

            GymsController.getGym(req, res);

            var actualGymId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(GYM_ID, actualGymId);
        });

        it('sends expected data on success', function () {
            var expectedGymInfo = {
                name: 'some name',
                address: 'some address'
            };
            GymsController.__set__({
                theGymsDao: {
                    getGym: function (pId, pCallback) {
                        pCallback(expectedGymInfo);
                    }
                }
            });

            GymsController.getGym(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedGymInfo);
        });
    });






    describe('#getGyms', function () {

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

        it('invokes the GymsDao getGyms method', function () {
            GymsController.__set__({
                theGymsDao: {
                    getGyms: methodUnderTestSpy
                }
            });

            GymsController.getGyms(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedGymsInfo = [
                {
                    name: 'gym 1 name',
                    address: 'gym 1 address'
                },
                {
                    name: 'gym 2 name',
                    address: 'gym 2 address'
                }
            ];

            GymsController.__set__({
                theGymsDao: {
                    getGyms: function (pCallback) {
                        pCallback(expectedGymsInfo);
                    }
                }
            });

            GymsController.getGyms(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedGymsInfo);
        });
    });






    describe('#createGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_NAME = 'some gym name',
            GYM_ADDRESS = 'some gym address';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                body: {
                    name: GYM_NAME,
                    address: GYM_ADDRESS
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the GymsDao createGym method with correct name parameter', function () {
            GymsController.__set__({
                theGymsDao: {
                    createGym: methodUnderTestSpy
                }
            });

            GymsController.createGym(req, res);

            var name = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(name, GYM_NAME);
        });

        it('invokes the GymsDao createGym method with correct address parameter', function () {
            GymsController.__set__({
                theGymsDao: {
                    createGym: methodUnderTestSpy
                }
            });

            GymsController.createGym(req, res);

            var address = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(address, GYM_ADDRESS);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            GymsController.__set__({
                theGymsDao: {
                    createGym: function (pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            GymsController.createGym(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });













    describe('#updateGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1,
            GYM_NAME = 'some gym name',
            GYM_ADDRESS = 'some gym address';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: GYM_ID
                },
                body: {
                    name: GYM_NAME,
                    address: GYM_ADDRESS
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the GymsDao updateGym method with expected id', function () {
            var name;

            GymsController.__set__({
                theGymsDao: {
                    updateGym: methodUnderTestSpy
                }
            });

            GymsController.updateGym(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, GYM_ID);
        });

        it('invokes the GymsDao updateGym method with expected name', function () {
            var name;

            GymsController.__set__({
                theGymsDao: {
                    updateGym: methodUnderTestSpy
                }
            });

            GymsController.updateGym(req, res);

            name = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(name, GYM_NAME);
        });

        it('invokes the GymsDao updateGym method with expected address', function () {
            var address;

            GymsController.__set__({
                theGymsDao: {
                    updateGym: methodUnderTestSpy
                }
            });

            GymsController.updateGym(req, res);

            address = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(address, GYM_ADDRESS);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
                actualData;

            GymsController.__set__({
                theGymsDao: {
                    updateGym: function (pId, pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            GymsController.updateGym(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });











    describe('#deleteGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: GYM_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the GymsDao deleteGym method with expected id', function () {
            var id;

            GymsController.__set__({
                theGymsDao: {
                    deleteGym: methodUnderTestSpy
                }
            });

            GymsController.deleteGym(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, GYM_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
                actualData;

            GymsController.__set__({
                theGymsDao: {
                    deleteGym: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            GymsController.deleteGym(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
