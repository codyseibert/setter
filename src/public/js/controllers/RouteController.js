/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, moment: false, confirm: false */

angular.module('SETTER')
    .controller('RouteController', ['$scope',
        '$routeParams',
        'RoutesService',
        'CommentsService',
        'RatingsService',
        'SendsService',
        'DateFormatService',
        'LoginService',
        function ($scope,
            $routeParams,
            RoutesService,
            CommentsService,
            RatingsService,
            SendsService,
            DateFormatService,
            LoginService) {
            'use strict';

            $scope.gymId = parseInt($routeParams.gymId, 10);
            $scope.wallId = $routeParams.wallId;
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
                    for (i = 0; i < pData.length; i += 1) {
                        pData[i].date = DateFormatService.format(pData[i].date);
                    }
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
                            message: $scope.form.message,
                            date: DateFormatService.formatWithTime(moment()),
                            url: LoginService.getImageUrl(),
                            name: LoginService.getName()
                        });
                        $scope.form.message = "";
                    });
            };

            $scope.send = function () {
                SendsService.createSend($scope.routeId)
                    .success(function () {
                        $scope.hasSent = true;

                        $scope.sends.push({
                            account_id: $scope.getAccountId(),
                            name: LoginService.getName(),
                            route_id: parseInt($scope.routeId, 10),
                            url: LoginService.getImageUrl()
                        });
                    });
            };

            $scope.unsend = function () {
                SendsService.deleteSend($scope.routeId)
                    .success(function () {
                        var accountId;

                        accountId = $scope.getAccountId();

                        for (i = 0; i < $scope.sends.length; i += 1) {
                            if ($scope.sends[i].account_id === accountId) {
                                $scope.sends.splice(i, 1);
                                break;
                            }
                        }

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

            $scope.edit = function () {
                $scope.navigateToEditRoute($scope.gymId, $scope.wallId, $scope.routeId);
            };

            $scope.delete = function () {
                var yes = confirm("Are you sure you want to delete this route?  All sends associated with this route will be lost for users =(");
                if (!yes) {
                    return;
                }

                RoutesService.deleteRoute($scope.routeId)
                    .success(function (pData) {
                        $scope.navigateToWall($scope.gymId, $scope.wallId);
                    });
            };

            $scope.strip = function () {
                var yes = confirm("Are you sure you want to strip this route?");
                if (!yes) {
                    return;
                }

                RoutesService.stripRoute($scope.routeId)
                    .success(function (pData) {
                        $scope.navigateToWall($scope.gymId, $scope.wallId);
                    });
            };
        }]);
