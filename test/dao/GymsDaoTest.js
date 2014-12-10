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
var GymsDao = rewire(helper('dao/GymsDao'));


describe('GymsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        GymsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getGym', function () {
        it('performs some type of SELECT query on the gyms table', function () {
            GymsDao.getGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
                query.indexOf('FROM gyms') !== -1);
        });

        it('query contains no *', function () {
            GymsDao.getGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#getGyms', function () {
        it('performs some type of SELECT query on the gyms table', function () {
            GymsDao.getGyms();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
                query.indexOf('FROM gyms') !== -1);
        });

        it('query contains no *', function () {
            GymsDao.getGyms();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });

        it('query contains no where clause', function () {
            GymsDao.getGyms();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE') === -1);
        });
    });

    describe('#createGym', function () {
        it('performs some type of INSERT on the gyms table', function () {
            GymsDao.createGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO gyms') !== -1);
        });
    });

    describe('#updateGym', function () {
        it('performs some type of UPDATE on the gyms table', function () {
            GymsDao.updateGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('UPDATE gyms') !== -1);
        });

        it('query contains a where clause!', function () {
            GymsDao.deleteGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });

    describe('#deleteGym', function () {
        it('performs some type of DELETE from the gyms tables', function () {
            GymsDao.deleteGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM gyms') !== -1);
        });

        it('query contains a where clause!', function () {
            GymsDao.deleteGym();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
