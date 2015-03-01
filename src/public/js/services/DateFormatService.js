/*jslint nomen: true */
/*global angular: false, moment: false */

angular.module('SETTER')
    .factory('DateFormatService', [function () {
        'use strict';

        return {
            format: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY");
            },
            formatWithTime: function (pDateString) {
                return moment(pDateString).format("MMM Do YYYY hh:mm:ss");
            },
            formatDates: function (pData) {
                var i,
                    length;

                for (i = 0, length = pData.length; i < length; i += 1) {
                    pData[i].date_format = this.format(pData[i].date);
                }
            }
        };
    }]);
