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
var DaoHelper = rewire(helper('dao/DaoHelper'));



describe('DaoHelper', function () {

    describe('#executeQuery', function () {

        var querySpy,
            callbackSpy;

        beforeEach(function () {
            querySpy = sinon.spy();
            callbackSpy = sinon.spy();
        });

        it('invokes query on the DBConnection object', function () {
            DaoHelper.__set__({
                theDB: {
                    query: querySpy
                }
            });

            DaoHelper.executeQuery('', [], DaoHelper.SINGLE, function() {});

            assert(querySpy.calledOnce);
        });

        it('calls back with error on error', function () {
            DaoHelper.__set__({
                theDB: {
                    query: function (pQuery, pValues, pCallback) {
                        pCallback(true, []);
                    }
                }
            });

            DaoHelper.executeQuery('', [], DaoHelper.SINGLE, callbackSpy);

            var actualMessage = callbackSpy.getCall(0).args[0];
            var expectedMessage = Messages.ERROR;
            assert.equal(actualMessage, expectedMessage);
        });

        it('calls back with error on no results', function () {
            DaoHelper.__set__({
                theDB: {
                    query: function (pQuery, pValues, pCallback) {
                        pCallback(false, []);
                    }
                }
            });

            DaoHelper.executeQuery('', [], DaoHelper.SINGLE, callbackSpy);

            var actualMessage = callbackSpy.getCall(0).args[0];
            var expectedMessage = Messages.error("No results returned on SINGLE query!");
            assert.deepEqual(actualMessage, expectedMessage);
        });

        it('invokes the callback on success with data', function () {
            var expectedData = ['some', 'arbitrary', 'data'];
            DaoHelper.__set__({
                theDB: {
                    query: function (pQuery, pValues, pCallback) {
                        pCallback(false, expectedData);
                    }
                }
            });

            DaoHelper.executeQuery('', [], DaoHelper.MULTIPLE, callbackSpy);

            var actualData = callbackSpy.getCall(0).args[0];
            assert.equal(actualData, expectedData);
        });
    });

});
