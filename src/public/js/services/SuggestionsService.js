/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SuggestionsService', ['$http', function ($http) {
        'use strict';

        return {
            getSuggestions: function () {
                return $http({
                    method: 'GET',
                    url: 'api/suggestions'
                });
            },
            upvoteSuggestion: function () {
                return $http({
                    method: 'GET',
                    url: 'api/suggestions/:suggestionId/upvote'
                });
            }
        };
    }]);
