/*jslint nomen: true */
/*jslint unparam: true*/
/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .controller('UserController', [
        '$scope',
        '$rootScope',
        '$routeParams',
        'LoginService',
        'UsersService',
        'BarGraphHelperService',
        'DateFormatService',
        'MessageService',
        function (
            $scope,
            $rootScope,
            $routeParams,
            LoginService,
            UsersService,
            BarGraphHelperService,
            DateFormatService,
            MessageService
        ) {
            'use strict';

            if (!LoginService.validateLoggedIn()) {
                return;
            }

            $scope.userId = parseInt($routeParams.userId, 10);
            $scope.hasActivity = true;

            //Used an object that contains the properties to say if they user has
            //each type of climbing
            //TO:DO Implement this same approach to the gym controller
            $scope.hasRoutes = {
                'bouldering' : false,
                'toprope' : false,
                'lead': false
            };


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

                    if($scope.projects.length === 0) {

                        $scope.hasNoProjects = true;
                    }
                });

            UsersService.getProgressions($scope.userId)
                .success(function (pData) {
                    $scope.boulderingProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'bouldering_grade');
                    $scope.topropeProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'toprope_grade');
                    $scope.leadProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'lead_grade');
                });

            MessageService.listen('projectSet', 'UserController', function (pData) {
                $scope.hasNoProjects = false;
                $scope.projects.push(pData);
            });

            MessageService.listen('projectUnset', 'UserController', function (pData) {
                $rootScope.splice($scope.projects, 'id', pData.id);

                if($scope.checkForProjects() === false) {
                    $scope.hasNoProjects = false;
                }
            });

            MessageService.listen('routeSent', 'UserController', function (pData) {
                var route = $rootScope.find($scope.projects, 'id', pData.id)
                if (route)
                  route.sent = true;
            });

            MessageService.listen('routeUnsent', 'UserController', function (pData) {
                var route = $rootScope.find($scope.projects, 'id', pData.id)
                if (route)
                  route.sent = false;
            });

            $scope.imageUploadCallback = function (content) {
                LoginService.setImageUrl(content.url);
                UsersService.setImageAsDirty(LoginService.getAccountId());
            };


            $scope.loadStatisticsData = function () {
                UsersService.getBoulderSends($scope.userId, 'bouldering')
                  .success(function (pData) {
                      $scope.boulderingSendsGraphData = BarGraphHelperService.preprocess(pData);
                      $scope.checkForRoutes($scope.boulderingSendsGraphData, 'bouldering');
                  });

                UsersService.getTopRopeSends($scope.userId, 'toprope')
                  .success(function (pData) {
                      $scope.topropeSendsGraphData = BarGraphHelperService.preprocess(pData);
                       $scope.checkForRoutes($scope.topropeSendsGraphData, 'toprope');
                  });

                UsersService.getLeadSends($scope.userId, 'lead')
                  .success(function (pData) {
                      $scope.leadSendsGraphData = BarGraphHelperService.preprocess(pData);
                       $scope.checkForRoutes($scope.leadSendsGraphData, 'lead');
                  });
            };

            $scope.checkForProjects = function() {

                if($scope.projects.length === 0) {

                    $scope.hasNoProjects = true;
                    return $scope.hasNoProjects;

                } else {

                    $scope.hasNoProjects = false;
                    return $scope.hasNoProjects;
                }

            };

            //TO:DO Implement this same approach for the gym controller
            //to check for data for placeholders
            $scope.checkForRoutes = function(pData, pRouteType) {

                if(pData.labels.length === 0) {
                    $scope.hasRoutes[pRouteType] = true;
                    return $scope.hasRoutes[pRouteType];
                }
                else {
                    $scope.hasRoutes[pRouteType] = false;
                    return $scope.hasRoutes[pRouteType];
                }


            };

            $scope.authorization = LoginService.getHeader();

        }]);
