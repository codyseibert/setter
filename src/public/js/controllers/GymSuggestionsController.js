/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

angular.module('SETTER')
    .controller('GymSuggestionsController', [
        '$scope',
        '$routeParams',
        'GymSuggestionsService',
        'DateFormatService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            GymSuggestionsService,
            DateFormatService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

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
                GymSuggestionsService.markAsRead($scope.gymId, pSuggestion.id)
                    .success(function () {
                        pSuggestion.read = true;
                    });
            };

            $scope.postSuggestion = function () {
                GymSuggestionsService.createSuggestion($scope.gymId, $scope.form.message)
                    .success(function () {
                        alert("Thank you for your suggestion!");
                        $scope.navigateToGym($scope.gymId);
                    });
            };

        }]);
