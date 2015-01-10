/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, alert: false */

angular.module('SETTER')
    .controller('SettersController', [
        '$scope',
        '$routeParams',
        'SettersService',
        'LoginService',
        function (
            $scope,
            $routeParams,
            SettersService,
            LoginService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.gymId = $routeParams.gymId;

            var createStars = function () {
                var stars = [],
                    i;
                for (i = 0; i < 5; i += 1) {
                    stars.push({
                        rating: i + 1
                    });
                }
                return stars;
            };

            SettersService.getSettersAtGym(LoginService.getAccountId())
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.stars = createStars();
                        return pEntry;
                    });
                    $scope.setters = pData;
                });

            $scope.removeSetterClicked = function (pSetter) {
                SettersService.removeSetterGymAccess($scope.gymId, pSetter.account_id)
                    .success(function () {
                        var index = $scope.setters.indexOf(pSetter);
                        $scope.setters.splice(index, 1);
                        alert(pSetter.firstname + " " + pSetter.lastname + " removed to your gym's setter list");
                    });
            };

            $scope.isFilled = function (pStar, pSetter) {
                if (pStar.rating <= pSetter.rating) {
                    return true;
                }
                return false;
            };
        }]);
