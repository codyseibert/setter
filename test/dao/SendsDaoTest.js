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
var SendsDao = rewire(helper('dao/SendsDao'));


describe('SendsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        SendsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getSendsForRoute', function () {
        it('performs some type of SELECT query on the sends table', function () {
            SendsDao.getSendsForRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
                query.indexOf('FROM sends') !== -1);
        });

        it('query contains no *', function () {
            SendsDao.getSendsForRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });

        it('query contains WHERE s.route_id = ?', function () {
            SendsDao.getSendsForRoute();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE s.route_id = ?') !== -1);
        });
    });

    describe('#createSend', function () {
        it('performs some type of INSERT on the sends table', function () {
            SendsDao.createSend();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO sends') !== -1);
        });
    });

    describe('#deleteSend', function () {
        it('performs some type of DELETE from the sends tables', function () {
            SendsDao.deleteSend();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM sends') !== -1);
        });

        it('query contains a where clause!', function () {
            SendsDao.deleteSend();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE user_id = ? AND route_id = ?') !== -1);
        });
    });
});
