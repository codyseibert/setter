/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var ErrorMessage = function () {
    'use strict';

    this.create = function (message) {
        return {
            error: message
        };
    };
};

module.exports = new ErrorMessage();
