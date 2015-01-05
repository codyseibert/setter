/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GymSuggestionsService', ['$http', function ($http) {
        'use strict';

        return {
            getSuggestionsForGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/suggestions'
                });
            },
            createSuggestion: function (pGymId, pMessage) {
                return $http({
                    method: 'POST',
                    url: 'api/gyms/' + pGymId + '/suggestions',
                    data: {
                        message: pMessage
                    }
                });
            },
            markAsRead: function (pGymId, pSuggestionId) {
                return $http({
                    method: 'POST',
                    url: 'api/gyms/' + pGymId + '/suggestions/' + pSuggestionId + '/read'
                });
            }
        };
    }]);
