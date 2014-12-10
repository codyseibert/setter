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

    /*
        Callback which simply sends the data returned from DAO callback to the user.

        $method createDefaultCallback
        $param pRes the response object used for sending the data to the user.
    */
    this.createDefaultCallback = function (pRes) {
        return function (pData) {
            pRes.send(pData);
        };
    };
};

module.exports = new DaoHelper();
