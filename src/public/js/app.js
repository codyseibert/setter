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
            .when('/gyms/register', {
                controller: 'RegisterGymController',
                templateUrl: 'templates/RegisterGym.tpl'
            })
            .when('/user/register', {
                controller: 'RegisterUserController',
                templateUrl: 'templates/RegisterUser.tpl'
            })
            .when('/gyms/:gymId/dashboard', {
                controller: 'GymDashboardController',
                templateUrl: 'templates/GymDashboard.tpl'
            })
            .when('/user/:userId/dashboard', {
                controller: 'UserDashboardController',
                templateUrl: 'templates/UserDashboard.tpl'
            })
            .when('/gyms', {
                controller: 'GymsController',
                templateUrl: 'templates/Gyms.tpl'
            })
            .when('/gyms/:gymId', {
                controller: 'GymController',
                templateUrl: 'templates/Gym.tpl'
            })
            .when('/gyms/:gymId/walls', {
                controller: 'WallsController',
                templateUrl: 'templates/Walls.tpl'
            })
            .otherwise({
                redirectTo: '/login'
            });

    }])
    .run(['$rootScope', '$location', 'LoginService', '$window', function ($rootScope, $location, LoginService, $window) {
        'use strict';

        $rootScope.navigateToLogin = function () {
            $location.path('login');
        };

        $rootScope.navigateToLogout = function () {
            $location.path('logout');
        };

        $rootScope.navigateToGymDashboard = function (pGymId) {
            $location.path('gyms/' + pGymId + '/dashboard');
        };

        $rootScope.navigateToUserDashboard = function (pUserId) {
            $location.path('user/' + pUserId + '/dashboard');
        };

        $rootScope.navigateToWalls = function (pGymId) {
            $location.path('gyms/' + pGymId + '/walls');
        };

        $rootScope.navigateToWall = function (pGymId, pWallId) {
            $location.path('gyms/' + pGymId + '/walls/' + pWallId);
        };

        $rootScope.navigateToGyms = function () {
            $location.path('gyms');
        };

        $rootScope.navigateToGym = function (pGymId) {
            $location.path('gyms/' + pGymId);
        };

        $rootScope.back = function () {
            $window.history.back();
        };

        $rootScope.isGymAccount = function () {
            return LoginService.isGymAccount();
        };

        $rootScope.isUserAccount = function () {
            return LoginService.isUserAccount();
        };

        $rootScope.isLoggedIn = function () {
            return LoginService.isLoggedIn();
        };

        if (LoginService.hasTokenInCookie()) {
            LoginService.setHeaderFromCookie();
            LoginService.setTypeFromCookie();
            LoginService.setAccountIdFromCookie();
        }
    }]);
