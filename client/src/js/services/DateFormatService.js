/*jslint nomen: true */
/*global angular: false, moment: false */

angular.module('SETTER')
    .factory('DateFormatService', [function () {
        'use strict';

        return {
            formatMonth: function (pDateString) {
                return moment(pDateString).format("MMM");
            },
            format: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY");
            },
            formatWithTime: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY hh:mm:ss");
            }
        };
    }]);
