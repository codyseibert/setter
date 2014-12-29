/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var mysql = require('mysql');

var DBConnection = function () {
    'use strict';

    if (process.env.APP_DIR_FOR_CODE_COVERAGE) {
        return undefined;
    }

    var connection;

    connection = mysql.createConnection({
        host: process.env.SETTER_DB_HOST,
        database: process.env.SETTER_DB_NAME,
        user: process.env.SETTER_DB_USER,
        password: process.env.SETTER_DB_PASS
    });
    connection.connect();

    return connection;
};

module.exports = new DBConnection();
