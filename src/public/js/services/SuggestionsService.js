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
            createSuggestion: function (pSuggestion) {
                return $http({
                    method: 'POST',
                    url: 'api/suggestions',
                    data: {
                        suggestion: pSuggestion
                    }
                });
            },
            upvoteSuggestion: function (pSuggestionId) {
                return $http({
                    method: 'POST',
                    url: 'api/suggestions/' + pSuggestionId + '/upvote'
                });
            }
        };
    }]);
