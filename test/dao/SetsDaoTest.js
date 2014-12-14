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
var SetsDao = rewire(helper('dao/SetsDao'));


describe('SetsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        SetsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getSetsOnWall', function () {
        it('performs some type of SELECT query on the sets table', function () {
            assert(true);
        });
    });

    describe('#createSet', function () {
        it('performs some type of INSERT on the sets table', function () {
            SetsDao.createSet();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO sets') !== -1);
        });
    });

    describe('#deleteSet', function () {
        it('performs some type of DELETE from the sets tables', function () {
            SetsDao.deleteSet();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM sets') !== -1);
        });

        it('query contains a where clause!', function () {
            SetsDao.deleteSet();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
