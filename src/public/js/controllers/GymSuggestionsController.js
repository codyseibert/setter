/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('GymSuggestionsController', [
        '$scope',
        '$routeParams',
        'GymSuggestionsService',
        'DateFormatService',
        function (
            $scope,
            $routeParams,
            GymSuggestionsService,
            DateFormatService
        ) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.form = {};

            if ($scope.getAccountId() === $scope.gymId) {
                GymSuggestionsService.getSuggestionsForGym($scope.gymId)
                    .success(function (pData) {
                        pData.map(function (pEntry) {
                            pEntry.date = DateFormatService.format(pEntry.date);
                            return pEntry;
                        });
                        $scope.suggestions = pData;
                    });
            }

            $scope.read = function (pSuggestion) {
                GymSuggestionsService.markAsRead(pSuggestion.id)
                    .success(function (pData) {
                        pSuggestion.read = true;
                    });
            };

            $scope.postSuggestion = function () {
                GymSuggestionsService.createSuggestion($scope.gymId, $scope.form.message)
                    .success(function (pData) {
                        alert("Thank you for your suggestion!");
                        $scope.navigateToGym($scope.gymId);
                    });
            };

        }]);
