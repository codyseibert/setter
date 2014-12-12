/*global angular: false, btoa: false */

angular.module('SETTER', ['ngRoute', 'ngCookies'])
    .config(['$routeProvider', function ($routeProvider) {
        'use strict';

        $routeProvider
            /*
            .when('/', {
                controller: 'LandingController',
                templateUrl: 'templates/Landing.tpl'
            })
            */
            .when('/gym/register', {
                controller: 'RegisterGymController',
                templateUrl: 'templates/RegisterGym.tpl'
            })
            .when('/user/register', {
                controller: 'RegisterUserController',
                templateUrl: 'templates/RegisterUser.tpl'
            })
            .when('/login', {
                controller: 'LoginController',
                templateUrl: 'templates/Login.tpl'
            })
            .when('/gym/dashboard', {
                controller: 'GymDashboardController',
                templateUrl: 'templates/GymDashboard.tpl'
            })
            .when('/user/dashboard', {
                controller: 'UserDashboardController',
                templateUrl: 'templates/UserDashboard.tpl'
            })
            .otherwise({
                redirectTo: '/login'
            });

    }])
    .run(['$rootScope', '$location', function ($rootScope, $location) {
        'use strict';
        angular.noop();

        $rootScope.navigateToGymDashboard = function () {
            $location.path('gym/dashboard');
        };

        $rootScope.navigateToUserDashboard = function () {
            $location.path('user/dashboard');
        };
    }]);
