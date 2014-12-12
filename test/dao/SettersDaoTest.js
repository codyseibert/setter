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
var SettersDao = rewire(helper('dao/SettersDao'));


describe('SettersDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        SettersDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getSetter', function () {
        it('performs some type of SELECT query on the setters table', function () {
            SettersDao.getSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM setters') !== -1);
        });

        it('query contains no *', function () {
            SettersDao.getSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#getSetters', function () {
        it('performs some type of SELECT query on the setters table', function () {
            SettersDao.getSetters();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
            query.indexOf('FROM setters') !== -1);
        });

        it('query contains no *', function () {
            SettersDao.getSetters();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });

        it('query contains no where clause', function () {
            SettersDao.getSetters();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE') === -1);
        });
    });

    describe('#createSetter', function () {
        it('performs some type of INSERT on the setters table', function () {
            SettersDao.createSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO setters') !== -1);
        });
    });

    describe('#updateSetter', function () {
        it('performs some type of UPDATE on the setters table', function () {
            SettersDao.updateSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('UPDATE setters') !== -1);
        });

        it('query contains a where clause!', function () {
            SettersDao.updateSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });

    describe('#deleteSetter', function () {
        it('performs some type of DELETE from the setters tables', function () {
            SettersDao.deleteSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM setters') !== -1);
        });

        it('query contains a where clause!', function () {
            SettersDao.deleteSetter();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE id = ?') !== -1);
        });
    });
});
