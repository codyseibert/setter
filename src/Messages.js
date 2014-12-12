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


    this.error = function (pMessage) {
        return {
            error: pMessage
        };
    };

    this.SUCCESS = {};
    this.ERROR = this.error('default error');
};

module.exports = new Messages();
