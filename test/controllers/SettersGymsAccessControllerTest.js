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
var SettersGymsAccessController = rewire(helper('controllers/SettersGymsAccessController'));


describe('SettersGymsAccessController', function () {





    describe('#getAccessList', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    id: GYM_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersGymsAccessDao getAccessList method', function () {
            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    getAccessList: methodUnderTestSpy
                }
            });

            SettersGymsAccessController.getAccessList(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedSettersGymsAccessInfo = [
                {
                    name: 'Comment 1 name',
                    address: 'Comment 1 address'
                }
            ];

            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    getAccessList: function (pGymId, pCallback) {
                        pCallback(expectedSettersGymsAccessInfo);
                    }
                }
            });

            SettersGymsAccessController.getAccessList(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedSettersGymsAccessInfo);
        });
    });






    describe('#createAccess', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1,
            SETTER_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    id: GYM_ID
                },
                params: {
                    id: SETTER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersGymsAccessDao createComment method with correct setter_id parameter', function () {
            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    createAccess: methodUnderTestSpy
                }
            });

            SettersGymsAccessController.createAccess(req, res);

            var setterId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(setterId, SETTER_ID);
        });

        it('invokes the SettersGymsAccessDao createComment method with correct gymId parameter', function () {
            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    createAccess: methodUnderTestSpy
                }
            });

            SettersGymsAccessController.createAccess(req, res);

            var gymId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(gymId, GYM_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    createAccess: function (pSetterId, pGymId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SettersGymsAccessController.createAccess(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });





















    describe('#deleteAccess', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            GYM_ID = 1,
            SETTER_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    id: GYM_ID
                },
                params: {
                    id: SETTER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersGymsAccessDao deleteAccess method with setterId', function () {
            var id;

            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    deleteAccess: methodUnderTestSpy
                }
            });

            SettersGymsAccessController.deleteAccess(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, SETTER_ID);
        });

        it('invokes the SettersGymsAccessDao deleteAccess method with gymId', function () {
            var id;

            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    deleteAccess: methodUnderTestSpy
                }
            });

            SettersGymsAccessController.deleteAccess(req, res);

            id = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(id, GYM_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            SettersGymsAccessController.__set__({
                theSettersGymsAccessDao: {
                    deleteAccess: function (pSetterId, pGymId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SettersGymsAccessController.deleteAccess(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
