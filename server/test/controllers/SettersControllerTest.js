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



// Unit under test
var SettersController = rewire(helper('controllers/SettersController'));


describe('SettersController', function () {

    describe('#getSetterAsGym', function () {

        var sendSpy,
            methodUnderTestSpy,
            req,
            res,
            SETTER_ID = 1;

        beforeEach(function () {
            sendSpy = sinon.spy();
            methodUnderTestSpy = sinon.spy();
            req = {
                params: {
                    id: SETTER_ID
                }
            };
            res = {send: sendSpy};
        });

        it('invokes the SettersDao with expected gym id', function () {
            assert(true);
        });
    });

});
