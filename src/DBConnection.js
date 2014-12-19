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
        host: 'localhost',//'104.131.253.44',
        database: 'setter',
        user: 'root',//'gmo',
        password: 'itisag00ddayt0die9921'
    });
    connection.connect();

    return connection;
};

module.exports = new DBConnection();
