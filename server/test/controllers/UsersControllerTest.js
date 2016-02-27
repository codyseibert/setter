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
var UsersController = rewire(helper('controllers/UsersController'));

describe('UsersController', function () {

    describe('#getUser', function () {

        var sendSpy,
        methodUnderTestSpy,
        req,
        res,
        User_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    userId: User_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the UsersDao with expected gym id', function () {
            UsersController.__set__({
                theUsersDao: {
                    getUser: methodUnderTestSpy
                }
            });

            UsersController.getUser(req, res);

            var actualUserId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(User_ID, actualUserId);
        });

        it('sends expected data on success', function () {
            var FIRSTNAME = 'cody',
            LASTNAME = 'seibert',
            expectedUserInfo = {
                firstname: FIRSTNAME,
                address: LASTNAME
            };
            UsersController.__set__({
                theUsersDao: {
                    getUser: function (pId, pCallback) {
                        pCallback(expectedUserInfo);
                    }
                }
            });

            UsersController.getUser(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedUserInfo);
        });
    });

    describe('#getUsers', function () {

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

        it('invokes the UsersDao getUsers method', function () {
            UsersController.__set__({
                theUsersDao: {
                    getUsers: methodUnderTestSpy
                }
            });

            UsersController.getUsers(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedUsersInfo = [
            {
                firstname: 'cody',
                lastname: 'seibert'
            },
            {
                firstname: 'bob',
                lastname: 'sagot'
            }
            ];

            UsersController.__set__({
                theUsersDao: {
                    getUsers: function (pCallback) {
                        pCallback(expectedUsersInfo);
                    }
                }
            });

            UsersController.getUsers(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedUsersInfo);
        });
    });
});
