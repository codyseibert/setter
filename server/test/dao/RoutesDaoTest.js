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
var RoutesDao = rewire(helper('dao/RoutesDao'));


describe('RoutesDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        RoutesDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getRoute', function () {
        it('performs some type of SELECT query on the routes table', function () {
            RoutesDao.getRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM routes') !== -1);
        });

        it('query contains no *', function () {
            RoutesDao.getRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#createRoute', function () {
        it('performs some type of INSERT on the routes table', function () {
            RoutesDao.createRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO routes') !== -1);
        });
    });

    describe('#updateRoute', function () {
        it('performs some type of UPDATE on the routes table', function () {
            RoutesDao.updateRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('UPDATE routes') !== -1);
        });

        it('query contains a where clause!', function () {
            RoutesDao.updateRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });

    describe('#deleteRoute', function () {
        it('performs some type of DELETE from the routes tables', function () {
            RoutesDao.deleteRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM routes') !== -1);
        });

        it('query contains a where clause!', function () {
            RoutesDao.deleteRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
