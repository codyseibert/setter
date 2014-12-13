/*global angular: false, btoa: false */

angular.module('SETTER', ['ngRoute', 'ngCookies'])
    .config(['$routeProvider', function ($routeProvider) {
        'use strict';

        $routeProvider
            .when('/login', {
                controller: 'LoginController',
                templateUrl: 'templates/Login.tpl'
            })
            .when('/logout', {
                controller: 'LogoutController',
                templateUrl: 'templates/Logout.tpl'
            })
            .when('/gym/register', {
                controller: 'RegisterGymController',
                templateUrl: 'templates/RegisterGym.tpl'
            })
            .when('/user/register', {
                controller: 'RegisterUserController',
                templateUrl: 'templates/RegisterUser.tpl'
            })
            .when('/gym/dashboard', {
                controller: 'GymDashboardController',
                templateUrl: 'templates/GymDashboard.tpl'
            })
            .when('/user/dashboard', {
                controller: 'UserDashboardController',
                templateUrl: 'templates/UserDashboard.tpl'
            })
            .when('/gym/:gymId/walls', {
                controller: 'WallsController',
                templateUrl: 'templates/Walls.tpl'
            })
            .otherwise({
                redirectTo: '/login'
            });

    }])
    .run(['$rootScope', '$location', 'LoginService', function ($rootScope, $location, LoginService) {
        'use strict';

        $rootScope.navigateToLogin = function () {
            $location.path('login');
        };

        $rootScope.navigateToLogout = function () {
            $location.path('logout');
        };

        $rootScope.navigateToGymDashboard = function () {
            $location.path('gym/dashboard');
        };

        $rootScope.navigateToUserDashboard = function () {
            $location.path('user/dashboard');
        };

        $rootScope.navigateToWall = function (pGymId, pWallId) {
            $location.path('gym/' + pGymId + '/walls/' + pWallId);
        };

        if (LoginService.hasTokenInCookie()) {
            LoginService.setHeaderFromCookie();
            LoginService.setTypeFromCookie();
        }
    }]);
