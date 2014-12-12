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


var Messages = require(helper('./Messages'));

// Unit under test
var CommentsDao = rewire(helper('dao/CommentsDao'));


describe('CommentsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        CommentsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getCommentsAboutRoute', function () {
        it('performs some type of SELECT query on the comments table', function () {
            CommentsDao.getCommentsAboutRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
                query.indexOf('FROM comments') !== -1);
        });

        it('query contains no *', function () {
            CommentsDao.getCommentsAboutRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#createComment', function () {
        it('performs some type of INSERT on the comments table', function () {
            CommentsDao.createComment();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO comments') !== -1);
        });
    });

    describe('#deleteComment', function () {
        it('performs some type of DELETE from the comments tables', function () {
            CommentsDao.deleteComment();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM comments') !== -1);
        });

        it('query contains a where clause!', function () {
            CommentsDao.deleteComment();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
