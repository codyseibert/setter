/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theDb = require('../DBConnection');
var theDaoHelper = require('./DaoHelper');

var ImagesDAO = function () {
    'use strict';

    this.insertImage = function (pUrl, pCallback) {
        theDaoHelper.executeQuery(
            'INSERT INTO images (url) VALUES (?)',
            [pUrl],
            theDaoHelper.INSERT,
            pCallback
        );
    };

};

module.exports = new ImagesDAO();
