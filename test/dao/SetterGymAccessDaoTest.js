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
var SettersGymsAccessDao = rewire(helper('dao/SettersGymsAccessDao'));

describe('SettersGymsAccessDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        SettersGymsAccessDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#getAccessList', function () {
        it('performs some type of SELECT query on the setters_gyms_access table', function () {
            SettersGymsAccessDao.getAccessList();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('SELECT') !== -1 &&
                query.indexOf('FROM setters_gyms_access') !== -1);
        });

        it('query contains no *', function () {
            SettersGymsAccessDao.getAccessList();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('*') === -1);
        });
    });

    describe('#createAccess', function () {
        it('performs some type of INSERT on the setters_gyms_access table', function () {
            SettersGymsAccessDao.createAccess();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO setters_gyms_access') !== -1);
        });
    });

    describe('#deleteAccess', function () {
        it('performs some type of DELETE from the setters_gyms_access tables', function () {
            SettersGymsAccessDao.deleteAccess();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('DELETE FROM setters_gyms_access') !== -1);
        });

        it('query contains a where clause!', function () {
            SettersGymsAccessDao.deleteAccess();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('WHERE gym_id = ? AND setter_id = ?') !== -1);
        });
    });
});
