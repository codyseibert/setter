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
                    gymId: GYM_ID
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

});
