/*jslint nomen: true */

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

/**
    Holds all the potential messages which could be returned to the client
*/
var Messages = function () {
    'use strict';

    this.SUCCESS = 'success';
    this.ERROR = 'error';

    this.error = function (pMessage) {
        return {
            error: pMessage
        };
    };
};

module.exports = new Messages();
