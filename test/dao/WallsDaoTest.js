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
var WallsDao = rewire(helper('dao/WallsDao'));


describe('WallsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        WallsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getWalls', function () {
        it('performs some type of SELECT query on the walls table', function () {
            WallsDao.getWalls();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM walls') !== -1);
        });

        it('query contains no *', function () {
            WallsDao.getWalls();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });

        it('query contains gym where clause', function () {
            WallsDao.getWalls();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE gym_id = ?') !== -1);
        });
    });

    describe('#createWall', function () {
        it('performs some type of INSERT on the Walls table', function () {
            WallsDao.createWall();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO walls') !== -1);
        });
    });

    describe('#updateWall', function () {
        it('performs some type of UPDATE on the walls table', function () {
            WallsDao.updateWall();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('UPDATE walls') !== -1);
        });

        it('query contains a where clause!', function () {
            WallsDao.updateWall();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });

    describe('#deleteWall', function () {
        it('performs some type of DELETE from the walls tables', function () {
            WallsDao.deleteWall();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM walls') !== -1);
        });

        it('query contains a where clause!', function () {
            WallsDao.deleteWall();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
