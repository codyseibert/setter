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
var RatingsController = rewire(helper('controllers/RatingsController'));


describe('RatingsController', function () {

    describe('#updateRating', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            VALUE = 3,
            USER_ID = 1,
            ROUTE_ID = 2;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    routeId: ROUTE_ID
                },
                user: {
                    accountId: USER_ID
                },
                body: {
                    rating: VALUE
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the RatingsDao updateRating method with expected userId', function () {
            var id;

            RatingsController.__set__({
                theRatingsDao: {
                    updateRating: methodUnderTestSpy
                }
            });

            RatingsController.updateRating(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, USER_ID);
        });

        it('invokes the RatingsDao updateRating method with expected routeId', function () {
            var routeId;

            RatingsController.__set__({
                theRatingsDao: {
                    updateRating: methodUnderTestSpy
                }
            });

            RatingsController.updateRating(req, res);

            routeId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(routeId, ROUTE_ID);
        });

        it('invokes the RatingsDao updateRating method with expected value', function () {
            var value;

            RatingsController.__set__({
                theRatingsDao: {
                    updateRating: methodUnderTestSpy
                }
            });

            RatingsController.updateRating(req, res);

            value = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(value, VALUE);
        });


        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            RatingsController.__set__({
                theRatingsDao: {
                    updateRating: function (pUserId, pRouteId, pValue, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            RatingsController.updateRating(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
