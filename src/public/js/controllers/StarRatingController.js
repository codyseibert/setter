/*jslint nomen: true */
/*global angular: false, btoa: false, console: false */

angular.module('SETTER')
    .controller('StarRatingController', [
        '$scope',
        function (
            $scope
        ) {
            'use strict';

            $scope.stars = [];

            var i;

            (function createStars() {
                for (i = 0; i < 5; i += 1) {
                    $scope.stars.push({
                        rating: i + 0.5
                    });
                }
            }());

            $scope.isFilled = function (pStar, pRoute) {
                if (pStar.rating <= pRoute.rating) {
                    return true;
                }
                return false;
            };
        }]);
