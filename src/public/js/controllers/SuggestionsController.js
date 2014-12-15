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

            var sortSuggestions,
                MAX_THUMB_SIZE = 60,
                BASE_THUMB_SIZE = 16,
                THUMB_GROW_COEF = 3;

            SuggestionsService.getSuggestions()
                .success(function (pData) {
                    $scope.suggestions = pData;
                    sortSuggestions();
                });

            sortSuggestions = function () {
                $scope.suggestions.sort(function (a, b) {
                    return b.upvotes - a.upvotes;
                });
            };

            $scope.postClicked = function () {
                SuggestionsService.createSuggestion($scope.form.suggestion)
                    .success(function (pData) {
                        alert("Thank you for your suggestion!");
                        $scope.suggestions.push({
                            id: pData.id,
                            suggestion: $scope.form.suggestion,
                            upvotes: 0
                        });
                        $scope.form.suggestion = "";
                    });
            };

            $scope.upvote = function (pSuggestion) {
                SuggestionsService.upvoteSuggestion(pSuggestion.id)
                    .success(function (pData) {
                        alert("Thank you for your upvote!");
                        pSuggestion.disabled = true;
                        pSuggestion.upvotes += 1;
                        sortSuggestions();
                    });
            };

            $scope.getFontSize = function (pSuggestion) {
                return Math.min(MAX_THUMB_SIZE, pSuggestion.upvotes * THUMB_GROW_COEF + BASE_THUMB_SIZE);
            };
        }]);
