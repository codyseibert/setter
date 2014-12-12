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
                    id: User_ID
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






    describe('#createUser', function () {

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

        it('invokes the UsersDao createUser method with correct name parameter', function () {
            UsersController.__set__({
                theUsersDao: {
                    createUser: methodUnderTestSpy
                }
            });

            UsersController.createUser(req, res);

            var firstname = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(firstname, FIRSTNAME);
        });

        it('invokes the UsersDao createUser method with correct address parameter', function () {
            UsersController.__set__({
                theUsersDao: {
                    createUser: methodUnderTestSpy
                }
            });

            UsersController.createUser(req, res);

            var lastname = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(lastname, LASTNAME);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            UsersController.__set__({
                theUsersDao: {
                    createUser: function (pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            UsersController.createUser(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });













    describe('#updateUser', function () {

        var sendSpy,
        methodUnderTestSpy,
        req,
        res,
        User_ID = 1,
        FIRSTNAME = 'cody',
        LASTNAME = 'seibert';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: User_ID
                },
                body: {
                    firstname: FIRSTNAME,
                    lastname: LASTNAME
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the UsersDao updateUser method with expected id', function () {
            var name;

            UsersController.__set__({
                theUsersDao: {
                    updateUser: methodUnderTestSpy
                }
            });

            UsersController.updateUser(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, User_ID);
        });

        it('invokes the UsersDao updateUser method with expected firstname', function () {
            var firstname;

            UsersController.__set__({
                theUsersDao: {
                    updateUser: methodUnderTestSpy
                }
            });

            UsersController.updateUser(req, res);

            firstname = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(firstname, FIRSTNAME);
        });

        it('invokes the UsersDao updateUser method with expected lastname', function () {
            var lastname;

            UsersController.__set__({
                theUsersDao: {
                    updateUser: methodUnderTestSpy
                }
            });

            UsersController.updateUser(req, res);

            lastname = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(lastname, LASTNAME);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            UsersController.__set__({
                theUsersDao: {
                    updateUser: function (pId, pName, pAddress, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            UsersController.updateUser(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });











    describe('#deleteUser', function () {

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
                    id: User_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the UsersDao deleteUser method with expected id', function () {
            var id;

            UsersController.__set__({
                theUsersDao: {
                    deleteUser: methodUnderTestSpy
                }
            });

            UsersController.deleteUser(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, User_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            UsersController.__set__({
                theUsersDao: {
                    deleteUser: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            UsersController.deleteUser(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
