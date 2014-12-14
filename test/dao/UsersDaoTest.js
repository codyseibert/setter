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
var UsersDao = rewire(helper('dao/UsersDao'));


describe('UsersDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        UsersDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getUser', function () {
        it('performs some type of SELECT query on the users table', function () {
            UsersDao.getUser();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM users') !== -1);
        });

        it('query contains no *', function () {
            UsersDao.getUser();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#getUsers', function () {
        it('performs some type of SELECT query on the users table', function () {
            UsersDao.getUsers();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM users') !== -1);
        });

        it('query contains no *', function () {
            UsersDao.getUsers();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });

        it('query contains no where clause', function () {
            UsersDao.getUsers();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE') === -1);
        });
    });
});
