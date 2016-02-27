/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('FeedbackService', ['$http', function ($http) {
        'use strict';

        return {
            createFeedback: function (pName, pMessage) {
                return $http({
                    method: 'POST',
                    url: 'api/feedback',
                    data: {
                        name: pName,
                        message: pMessage
                    }
                });
            }
        };
    }]);
