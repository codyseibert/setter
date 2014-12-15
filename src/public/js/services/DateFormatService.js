/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('DateFormatService', [function () {
        'use strict';

        return {
            format: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY");
            },
            formatWithTime: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY hh:mm:ss");
            }
        };
    }]);
