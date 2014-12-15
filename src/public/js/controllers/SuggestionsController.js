/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, alert: false */

angular.module('SETTER')
    .controller('SuggestionsController', [
        '$scope',
        'SuggestionsService',
        function ($scope,
            SuggestionsService) {
            'use strict';

            SuggestionsService.getSuggestions()
                .success(function (pData) {
                    $scope.suggestions = pData;
                });

            $scope.createSuggestion = function () {
                SuggestionsService.createSuggestion($scope.form.suggestion)
                    .success(function (pData) {
                        alert("Thank you for your suggestion!");
                    });
            };

            $scope.upvote = function (pSuggestion) {
                SuggestionsService.upvoteSuggestion(pSuggestion.id)
                    .success(function (pData) {
                        alert("Thank you for your upvote!");
                    });
            };
        }]);
