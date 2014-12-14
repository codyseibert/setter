/*
    Copyright (c) Cody Seibert and Guillermo Martinez

    Do not copy, redistribute, sell, modify, etc, without
    written legally bound permission from both Cody Seibert and
    Guillermo Martinez.
*/

var theDB = require('../DBConnection');
var theMessages = require('../Messages');

/**
    Helper class used to create the generic functionality required
    with making a query to the database.  It will return an error
    message on any error connecting to the database.

    $param pQuery the query to execute
    $param pValues the values to pass into that query
    $param pCallback the callback to invoke when query finishes
*/
var DaoHelper = function () {
    'use strict';

    this.INSERT = 0;
    this.UPDATE = 1;
    this.SINGLE = 2;
    this.MULTIPLE = 3;
    this.DELETE = 4;
    var that = this;

    this.executeQuery = function (pQuery, pValues, pType, pCallback) {
        theDB.query(pQuery, pValues, function (pErr, pResults) {
            if (pErr) {
                console.log(pErr);
                pCallback(theMessages.ERROR);
            } else if (!pResults) {
                pCallback(theMessages.error("No results returned on query!"));
            } else {
                if (pType === that.INSERT) {
                    pCallback({id: pResults.insertId});
                } else if (pType === that.SINGLE) {
                    if (pResults.length <= 0) {
                        pCallback(theMessages.error("No results returned on SINGLE query!"));
                    } else {
                        pCallback(pResults[0]);
                    }
                } else {
                    pCallback(pResults);
                }
            }
        });
    };
};

module.exports = new DaoHelper();
