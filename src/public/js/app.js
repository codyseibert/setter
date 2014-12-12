/*global angular: false, btoa: false */

angular.module('SETTER', ['ngRoute', 'ngCookies'])
    .config(['$routeProvider', function ($routeProvider) {
        'use strict';

        $routeProvider
            .when('/', {
                controller: 'LandingController',
                templateUrl: 'templates/Landing.tpl'
            })

            .when('/register', {
                controller: 'RegisterController',
                templateUrl: 'templates/Register.tpl'
            })
            .when('/register/gym', {
                controller: 'RegisterGymController',
                templateUrl: 'templates/RegisterGym.tpl'
            })
            .when('/register/user', {
                controller: 'RegisterUserController',
                templateUrl: 'templates/RegisterUser.tpl'
            })
            .when('/register/setter', {
                controller: 'RegisterSetterController',
                templateUrl: 'templates/RegisterSetter.tpl'
            })

            .when('/login', {
                controller: 'LoginController',
                templateUrl: 'templates/Login.tpl'
            })

            .otherwise({
                redirectTo: '/error'
            });

    }])
    .run([function () {
        'use strict';
        angular.noop();
    }]);
