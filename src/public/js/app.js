/*global angular: false, btoa: false */

angular.module('SETTER', ['ngRoute', 'ngCookies', 'chart.js'])
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
            .when('/gyms/:gymId/walls/:wallId', {
                controller: 'WallController',
                templateUrl: 'templates/Wall.tpl'
            })
            .when('/gyms/:gymId/walls/:wallId/sets/:setId', {
                controller: 'SetController',
                templateUrl: 'templates/Set.tpl'
            })
            .when('/gyms/:gymId/walls/:wallId/sets/:setId/routes/create', {
                controller: 'CreateRouteController',
                templateUrl: 'templates/CreateRoute.tpl'
            })
            .when('/gyms/:gymId/walls/:wallId/sets/:setId/routes/:routeId', {
                controller: 'RouteController',
                templateUrl: 'templates/Route.tpl'
            })
            .when('/setters', {
                controller: 'AddSettersController',
                templateUrl: 'templates/AddSetters.tpl'
            })
            .when('/users/:userId', {
                controller: 'UserProfileController',
                templateUrl: 'templates/UserProfile.tpl'
            })
            .when('/suggestions', {
                controller: 'SuggestionsController',
                templateUrl: 'templates/Suggestions.tpl'
            })
            .when('/contact', {
                controller: 'ContactController',
                templateUrl: 'templates/Contact.tpl'
            })
            .when('/tos', {
                controller: 'TOSController',
                templateUrl: 'templates/TOS.tpl'
            })
            .otherwise({
                redirectTo: '/login'
            });

    }])
    .run(['$rootScope', '$location', 'LoginService', '$window', function ($rootScope, $location, LoginService, $window) {
        'use strict';

        // Set the global chart colors used throughout the site
        Chart.defaults.global.colours[0].fillColor = "rgba(174, 216, 80, 1)";
        Chart.defaults.global.colours[0].strokeColor = "rgba(84, 72, 127, 0.5)";
        Chart.defaults.global.colours[0].pointColor = "rgba(84, 72, 127, 0.5)";

        $rootScope.chartOptions = {
            scaleFontColor: "#000",
            scaleFontSize: 20
        };

        $rootScope.navigateToLogin = function () {
            $location.path('login');
        };

        $rootScope.navigateToRegisterUser = function () {
            $location.path('user/register');
        };

        $rootScope.navigateToRegisterGym = function () {
            $location.path('gym/register');
        };

        $rootScope.navigateToLogout = function () {
            var yes = confirm("Are you sure you want to log out?");
            if (yes) {
                $location.path('logout');
            }
        };

        $rootScope.navigateToContact = function () {
            $location.path('contact');
        };

        $rootScope.navigateToTOS = function () {
            $location.path('tos');
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

        $rootScope.navigateToSet = function (pGymId, pWallId, pSetId) {
            $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/sets/' + pSetId);
        };

        $rootScope.navigateToGyms = function () {
            $location.path('gyms');
        };

        $rootScope.navigateToGym = function (pGymId) {
            $location.path('gyms/' + pGymId);
        };

        $rootScope.navigateToCreateRoute = function (pGymId, pWallId, pSetId) {
            $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/sets/' + pSetId + '/routes/create');
        };

        $rootScope.navigateToAddSetters = function () {
            $location.path('setters');
        };

        $rootScope.navigateToRoute = function (pGymId, pWallId, pSetId, pRouteId) {
            $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/sets/' + pSetId + '/routes/' + pRouteId);
        };

        $rootScope.navigateToUserProfile = function (pUserId) {
            $location.path('users/' + pUserId);
        };

        $rootScope.navigateToSuggestionsPage = function () {
            $location.path('suggestions');
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

        $rootScope.getAccountId = function () {
            return LoginService.getAccountId();
        };

        $rootScope.isLoggedIn = function () {
            return LoginService.isLoggedIn();
        };

        $rootScope.getHomeGymId = function () {
            return LoginService.getHomeGymId();
        };

        if (LoginService.hasTokenInCookie()) {
            LoginService.setHeaderFromCookie();
            LoginService.setTypeFromCookie();
            LoginService.setAccountIdFromCookie();
            LoginService.setHomeGymIdFromCookie();
        }
    }]);
