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
                if (pData.bouldering_grade)
                  $scope.boulderGrade = 'V' + parseFloat(pData.bouldering_grade).toFixed(0);
                if (pData.toprope_grade)
                  $scope.topRopeGrade = '5.' + parseFloat(pData.toprope_grade).toFixed(0);
                if (pData.lead_grade)
                  $scope.leadGrade = '5.' + parseFloat(pData.lead_grade).toFixed(0);
            });

            UsersService.getUserImage($scope.userId, function (pData) {
                $scope.image = pData.url;
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


            UsersService.getProjects($scope.userId)
                .success(function (pData) {
                    pData.map(function (pEntry) {
                        pEntry.date = DateFormatService.format(pEntry.date);
                        return pEntry;
                    });
                    $scope.projects = pData;
                });


            $scope.imageUploadCallback = function (content) {
                LoginService.setImageUrl(content.url);
                UsersService.setImageAsDirty(LoginService.getAccountId());
            };


            $scope.loadStatisticsData = function () {
                UsersService.getBoulderSends($scope.userId, 'bouldering')
                  .success(function (pData) {
                      $scope.boulderingSendsGraphData = BarGraphHelperService.preprocess(pData);
                  });

                UsersService.getTopRopeSends($scope.userId, 'toprope')
                  .success(function (pData) {
                      $scope.topropeSendsGraphData = BarGraphHelperService.preprocess(pData);
                  });

                UsersService.getLeadSends($scope.userId, 'lead')
                  .success(function (pData) {
                      $scope.leadSendsGraphData = BarGraphHelperService.preprocess(pData);
                  });
            };

            $scope.authorization = LoginService.getHeader();

        }]);
