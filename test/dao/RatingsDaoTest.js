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
var RatingsDao = rewire(helper('dao/RatingsDao'));


describe('RatingsDao', function () {

    var daoHelperSpy;

    beforeEach(function () {
        daoHelperSpy = sinon.spy();

        RatingsDao.__set__({
            theDaoHelper: {
                executeQuery: daoHelperSpy
            }
        });
    });

    describe('#updateRating', function () {
        it('performs some type of INSERT on the ratings table', function () {
            RatingsDao.updateRating();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('INSERT INTO ratings') !== -1);
        });

        it('query contains ON DUPLICATE KEY UPDATE', function () {
            RatingsDao.updateRating();

            var query = daoHelperSpy.getCall(0).args[0];
            assert(query.indexOf('ON DUPLICATE KEY UPDATE') !== -1);
        });
    });
});
