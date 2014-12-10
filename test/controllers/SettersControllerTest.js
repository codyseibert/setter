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
var SettersController = rewire(helper('controllers/SettersController'));


describe('SettersController', function () {

    describe('#getSetter', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SETTER_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: SETTER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersDao with expected gym id', function () {
            SettersController.__set__({
                theSettersDao: {
                    getSetter: methodUnderTestSpy
                }
            });

            SettersController.getSetter(req, res);

            var actualSetterId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(SETTER_ID, actualSetterId);
        });

        it('sends expected data on success', function () {
            var FIRSTNAME = 'cody',
                LASTNAME = 'seibert',
                expectedSetterInfo = {
                    firstname: FIRSTNAME,
                    address: LASTNAME
                };
            SettersController.__set__({
                theSettersDao: {
                    getSetter: function (pId, pCallback) {
                        pCallback(expectedSetterInfo);
                    }
                }
            });

            SettersController.getSetter(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedSetterInfo);
        });
    });






    describe('#getSetters', function () {

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

        it('invokes the SettersDao getSetters method', function () {
            SettersController.__set__({
                theSettersDao: {
                    getSetters: methodUnderTestSpy
                }
            });

            SettersController.getSetters(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedSettersInfo = [
            {
                firstname: 'cody',
                lastname: 'seibert'
            },
            {
                firstname: 'bob',
                lastname: 'sagot'
            }
            ];

            SettersController.__set__({
                theSettersDao: {
                    getSetters: function (pCallback) {
                        pCallback(expectedSettersInfo);
                    }
                }
            });

            SettersController.getSetters(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedSettersInfo);
        });
    });






    describe('#createSetter', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            FIRSTNAME = 'cody',
            LASTNAME = 'seibert';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                body: {
                    firstname: FIRSTNAME,
                    lastname: LASTNAME
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersDao createSetter method with correct name parameter', function () {
            SettersController.__set__({
                theSettersDao: {
                    createSetter: methodUnderTestSpy
                }
            });

            SettersController.createSetter(req, res);

            var firstname = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(firstname, FIRSTNAME);
        });

        it('invokes the SettersDao createSetter method with correct address parameter', function () {
            SettersController.__set__({
                theSettersDao: {
                    createSetter: methodUnderTestSpy
                }
            });

            SettersController.createSetter(req, res);

            var lastname = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(lastname, LASTNAME);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            SettersController.__set__({
                theSettersDao: {
                    createSetter: function (pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SettersController.createSetter(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });













    describe('#updateSetter', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SETTER_ID = 1,
            FIRSTNAME = 'cody',
            LASTNAME = 'seibert';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: SETTER_ID
                },
                body: {
                    firstname: FIRSTNAME,
                    lastname: LASTNAME
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersDao updateSetter method with expected id', function () {
            var name;

            SettersController.__set__({
                theSettersDao: {
                    updateSetter: methodUnderTestSpy
                }
            });

            SettersController.updateSetter(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, SETTER_ID);
        });

        it('invokes the SettersDao updateSetter method with expected firstname', function () {
            var firstname;

            SettersController.__set__({
                theSettersDao: {
                    updateSetter: methodUnderTestSpy
                }
            });

            SettersController.updateSetter(req, res);

            firstname = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(firstname, FIRSTNAME);
        });

        it('invokes the SettersDao updateSetter method with expected lastname', function () {
            var lastname;

            SettersController.__set__({
                theSettersDao: {
                    updateSetter: methodUnderTestSpy
                }
            });

            SettersController.updateSetter(req, res);

            lastname = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(lastname, LASTNAME);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
                actualData;

            SettersController.__set__({
                theSettersDao: {
                    updateSetter: function (pId, pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SettersController.updateSetter(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });











    describe('#deleteSetter', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SETTER_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: SETTER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersDao deleteSetter method with expected id', function () {
            var id;

            SettersController.__set__({
                theSettersDao: {
                    deleteSetter: methodUnderTestSpy
                }
            });

            SettersController.deleteSetter(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, SETTER_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
                actualData;

            SettersController.__set__({
                theSettersDao: {
                    deleteSetter: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            SettersController.deleteSetter(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
