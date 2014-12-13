/*jslint nomen: true */

/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');
var theDaoHelper = require('./DaoHelper');

/**
    GymsDao

    Contains logic related to gyms.
*/
var GymsDao = function () {
    'use strict';

    /**
        Gets a gym record.

        $method getGym
        $param pId the ID of the gym to fetch
        $param pCallback invoked on success or failure.
    */
    this.getGym = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, name, address FROM gyms WHERE account_id = ?',
            [pId],
            theDaoHelper.SINGLE,
            pCallback
        );
    };

    /**
        Returns all gym records.

        $method getGyms
        $param pCallback invoked on success or failure.
    */
    this.getGyms = function (pCallback) {
        theDaoHelper.executeQuery(
            'SELECT account_id, name, address FROM gyms',
            [],
            theDaoHelper.MULTIPLE,
            pCallback
        );
    };

    /**
        Creates a gym record.

        $method createGym
        $param pName the name to set this gym
        $param pAddress the address to set this gym
        $param pCallback invoked on success or failure.
    */
    this.createGym = function (pAccountId, pName, pAddress, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO gyms (account_id, name, address) VALUES (?, ?, ?)',
            [pAccountId, pName, pAddress],
            theDaoHelper.INSERT,
            pCallback
        );
    };

    /**
        Updates a gym record.

        $method updateGym
        $param pId the id of the gym to update
        $param pName the name to set this gym
        $param pAddress the address to set this gym
        $param pCallback invoked on success or failure.
    */
    this.updateGym = function (pId, pName, pAddress, pCallback) {
        theDaoHelper.executeQuery(
            'UPDATE gyms SET name = ? AND address = ? WHERE account_id = ?',
            [pName, pAddress, pId],
            theDaoHelper.UPDATE,
            pCallback
        );
    };

    /**
        Deletes a gym record.

        $method deleteGym
        $param pId the id of the gym to delete
        $param pCallback invoked on success or failure.
    */
    this.deleteGym = function (pId, pCallback) {
        theDaoHelper.executeQuery(
            'DELETE FROM gyms WHERE account_id = ?',
            [pId],
            theDaoHelper.DELETE,
            pCallback
        );
    };
};

module.exports = new GymsDao();
