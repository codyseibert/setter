/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false */

angular.module('SETTER')
    .controller('RouteController', ['$scope',
        '$routeParams',
        'RoutesService',
        'CommentsService',
        'RatingsService',
        'SendsService',
        function ($scope,
            $routeParams,
            RoutesService,
            CommentsService,
            RatingsService,
            SendsService) {
            'use strict';

            $scope.gymId = $routeParams.gymId;
            $scope.wallId = $routeParams.wallId;
            $scope.setId = $routeParams.setId;
            $scope.routeId = $routeParams.routeId;

            $scope.form = {};
            $scope.stars = [];

            var i,
                loadRouteRating;

            (function createStars() {
                for (i = 0; i < 5; i += 1) {
                    $scope.stars.push({
                        rating: i + 1
                    });
                }
            }());

            RoutesService.getRoute($scope.routeId)
                .success(function (pData) {
                    $scope.route = pData;
                });


            CommentsService.getCommentsAboutRoute($scope.routeId)
                .success(function (pData) {
                    $scope.comments = pData;
                });

            loadRouteRating = function () {
                RatingsService.getRatingForRoute($scope.routeId)
                    .success(function (pData) {
                        $scope.rating = parseInt(pData.rating + 0.5, 10);
                    });
            };
            loadRouteRating();

            RatingsService.hasRated($scope.routeId)
                .success(function (pData) {
                    if (pData.error) {
                        $scope.hasRated = false;
                    } else {
                        $scope.hasRated = true;
                    }
                });

            SendsService.getSendsForRoute($scope.routeId)
                .success(function (pData) {
                    $scope.sends = pData;
                });

            SendsService.hasSent($scope.routeId)
                .success(function (pData) {
                    if (pData.error) {
                        $scope.hasSent = false;
                    } else {
                        $scope.hasSent = true;
                    }
                });

            $scope.addComment = function () {
                CommentsService.createComment($scope.routeId, $scope.form.message)
                    .success(function (pData) {
                        $scope.comments.push({
                            id: pData.id,
                            message: $scope.form.message
                        });
                        $scope.form.message = "";
                    });
            };

            $scope.send = function () {
                SendsService.createSend($scope.routeId)
                    .success(function () {
                        $scope.hasSent = true;
                    });
            };

            $scope.unsend = function () {
                SendsService.deleteSend($scope.routeId)
                    .success(function () {
                        $scope.hasSent = false;
                    });
            };

            $scope.setHoverRating = function (pStar) {
                $scope.hoverRating = pStar.rating;
            };

            $scope.rate = function (pStar) {
                RatingsService.updateRating($scope.routeId, pStar.rating)
                    .success(function () {
                        $scope.hasRated = true;
                        loadRouteRating();
                    });
            };

            $scope.isFilled = function (pStar) {
                if (pStar.rating <= $scope.hoverRating ||
                        pStar.rating <= $scope.rating) {
                    return true;
                }
                return false;
            };
        }]);
