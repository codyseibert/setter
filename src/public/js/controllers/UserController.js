/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .controller('UserController', [
        '$scope',
        '$routeParams',
        'LoginService',
        'UsersService',
        'BarGraphHelperService',
        'DateFormatService',
        function (
            $scope,
            $routeParams,
            LoginService,
            UsersService,
            BarGraphHelperService,
            DateFormatService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.userId = parseInt($routeParams.userId, 10);
            $scope.hasActivity = true;

            UsersService.getUser($scope.userId, function (pData) {
                $scope.user = pData;
            });

            UsersService.getUserImage($scope.userId, function (pData) {
                $scope.image = pData;
            });

            UsersService.getActivityStream($scope.userId)
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.date = DateFormatService.format(pEntry.date);
                        return pEntry;
                    });
                    $scope.activity = pData;

                    $scope.hasActivity = pData.length > 0;
                });

            /*
            *   SECTION - Image
            */
            $scope.uploadImage = function () {
                angular.element("#image_file").trigger('click');
            };

            angular.element("#image_file").on('change', function () {
                angular.element("#image_submit").trigger('click');
                $scope.image = {
                    url: 'images/loading.gif'
                };
                $scope.$apply();
            });

            $scope.complete = function (content) {
                $scope.image = content;
                LoginService.setImageUrl(content.url);
                UsersService.setImageAsDirty(LoginService.getAccountId());
            };



            /*
            *   SECTION - MISC
            */
            $scope.showSendsCharts = function () {
                angular.element('#charts').css('left', '0px');
                angular.element('#charts').css('position', 'relative');
            };

            $scope.hideSendsCharts = function () {
                angular.element('#charts').css('left', '9999px');
                angular.element('#charts').css('position', 'absolute');
            };

            $scope.hideSendsCharts();

            $scope.authorization = LoginService.getHeader();

        }]);
