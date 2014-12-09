/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var db = require('../DBConnection');

var ImagesDAO = function () {
    'use strict';

    this.insertImage = function (url, callback) {
        var query,
            values;
        query = "INSERT INTO images (url) VALUES (?)";
        values = [url];
        db.query(query, values, function (err, results) {
            callback(err, results);
        });
    };

};

module.exports = new ImagesDAO();
