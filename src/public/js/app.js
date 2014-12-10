/*global angular: false, btoa: false */

angular.module('SETTER', ['ngRoute', 'ngCookies', 'ngUpload'])
    .config(['$routeProvider', function ($routeProvider) {
        'use strict';

        .when('/register', {
            controller: 'registerController',
            templateUrl: 'templates/register.tpl'
        })
        .otherwise({
            redirectTo: '/'
        });

    }])

    .run([function () {
        'use strict';

    }]);
