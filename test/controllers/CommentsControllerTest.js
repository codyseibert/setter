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
var CommentsController = rewire(helper('controllers/CommentsController'));


describe('CommentsController', function () {





    describe('#getCommentsAboutRoute', function () {

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

        it('invokes the CommentsDao getCommentsAboutRoute method', function () {
            CommentsController.__set__({
                theCommentsDao: {
                    getCommentsAboutRoute: methodUnderTestSpy
                }
            });

            CommentsController.getCommentsAboutRoute(req, res);

            assert(methodUnderTestSpy.calledOnce);
        });

        it('sends expected data on success', function () {
            var expectedCommentsInfo = [
                {
                    name: 'Comment 1 name',
                    address: 'Comment 1 address'
                },
                {
                    name: 'Comment 2 name',
                    address: 'Comment 2 address'
                }
            ];

            CommentsController.__set__({
                theCommentsDao: {
                    getCommentsAboutRoute: function (pRouteId, pCallback) {
                        pCallback(expectedCommentsInfo);
                    }
                }
            });

            CommentsController.getCommentsAboutRoute(req, res);

            var actualInfo = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualInfo, expectedCommentsInfo);
        });
    });






    describe('#createComment', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            USER_ID = 1,
            ROUTE_ID = 2,
            MESSAGE = 'hi';

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                user: {
                    id: USER_ID
                },
                body: {
                    message: MESSAGE
                },
                params: {
                    id: ROUTE_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the CommentsDao createComment method with correct userId parameter', function () {
            CommentsController.__set__({
                theCommentsDao: {
                    createComment: methodUnderTestSpy
                }
            });

            CommentsController.createComment(req, res);

            var userId = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(userId, USER_ID);
        });

        it('invokes the CommentsDao createComment method with correct routeId parameter', function () {
            CommentsController.__set__({
                theCommentsDao: {
                    createComment: methodUnderTestSpy
                }
            });

            CommentsController.createComment(req, res);

            var routeId = methodUnderTestSpy.getCall(0).args[1];
            assert.equal(routeId, ROUTE_ID);
        });

        it('invokes the CommentsDao createComment method with correct message parameter', function () {
            CommentsController.__set__({
                theCommentsDao: {
                    createComment: methodUnderTestSpy
                }
            });

            CommentsController.createComment(req, res);

            var message = methodUnderTestSpy.getCall(0).args[2];
            assert.equal(message, MESSAGE);
        });

        it('sends expected data on success', function () {
            var expectedData = {something: 'else'};

            CommentsController.__set__({
                theCommentsDao: {
                    createComment: function (pUserId, pRouteId, pMessage, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            CommentsController.createComment(req, res);

            var actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });





















    describe('#deleteComment', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            COMMENT_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: COMMENT_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the CommentsDao deleteComment method with commentId id', function () {
            var id;

            CommentsController.__set__({
                theCommentsDao: {
                    deleteComment: methodUnderTestSpy
                }
            });

            CommentsController.deleteComment(req, res);

            id = methodUnderTestSpy.getCall(0).args[0];
            assert.equal(id, COMMENT_ID);
        });

        it('sends expected data on success', function () {
            var expectedData = 'some data',
            actualData;

            CommentsController.__set__({
                theCommentsDao: {
                    deleteComment: function (pId, pCallback) {
                        pCallback(expectedData);
                    }
                }
            });

            CommentsController.deleteComment(req, res);

            actualData = sendSpy.getCall(0).args[0];
            assert.deepEqual(actualData, expectedData);
        });
    });
});
