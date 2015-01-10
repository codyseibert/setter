/*global angular: false, btoa: false, Chart: false, confirm: false, FastClick: false */

angular.module('SETTER', [
    'ngRoute',
    'ngCookies',
    'chart.js',
    'ngUpload',
    'ngAnimate',
    'mm.foundation',
    'mm.foundation.tabs',
    'mm.foundation.offcanvas',
    'pasvaz.bindonce',
    'angularSpinner'])
    .config([
        '$routeProvider',
        function (
            $routeProvider
        ) {
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
            .when('/blog', {
                controller: 'BlogController',
                templateUrl: 'templates/Blog.tpl'
            })
            .when('/gym/register', {
                controller: 'RegisterGymController',
                templateUrl: 'templates/RegisterGym.tpl'
            })
            .when('/user/register', {
                controller: 'RegisterUserController',
                templateUrl: 'templates/RegisterUser.tpl'
            })
            .when('/gyms', {
                controller: 'GymsController',
                templateUrl: 'templates/Gyms.tpl'
            })
            .when('/gyms/:gymId/suggestions', {
                controller: 'GymSuggestionsController',
                templateUrl: 'templates/GymSuggestions.tpl'
            })
            .when('/gyms/:gymId', {
                controller: 'GymController',
                templateUrl: 'templates/Gym.tpl'
            })
            .when('/gyms/:gymId/alerts', {
                controller: 'AlertsController',
                templateUrl: 'templates/Alerts.tpl'
            })
            .when('/gyms/:gymId/walls', {
                controller: 'WallsController',
                templateUrl: 'templates/Walls.tpl'
            })
            .when('/gyms/:gymId/walls/:wallId', {
                controller: 'WallController',
                templateUrl: 'templates/Wall.tpl'
            })
            .when('/gyms/:gymId/walls/:wallId/routes/create', {
                controller: 'CreateRouteController',
                templateUrl: 'templates/CreateRoute.tpl',
                resolve: {
                    isEditMode: function () {
                        return false;
                    }
                }
            })
            .when('/gyms/:gymId/walls/:wallId/routes/:routeId/edit', {
                controller: 'CreateRouteController',
                templateUrl: 'templates/CreateRoute.tpl',
                resolve: {
                    isEditMode: function () {
                        return true;
                    }
                }
            })
            .when('/gyms/:gymId/walls/:wallId/routes/:routeId', {
                controller: 'RouteController',
                templateUrl: 'templates/Route.tpl'
            })
            .when('/gyms/:gymId/setters', {
                controller: 'SettersController',
                templateUrl: 'templates/Setters.tpl'
            })
            .when('/gyms/:gymId/setters/add', {
                controller: 'AddSetterController',
                templateUrl: 'templates/AddSetter.tpl'
            })
            .when('/gyms/:gymId/routes', {
                controller: 'RouteManagerController',
                templateUrl: 'templates/RouteManager.tpl'
            })
            .when('/users/:userId', {
                controller: 'UserController',
                templateUrl: 'templates/User.tpl'
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
    .run([
        '$rootScope',
        '$location',
        '$window',
        'UsersService',
        'GymsService',
        'WallsService',
        'RoutesService',
        'LoginService',
        function (
            $rootScope,
            $location,
            $window,
            UsersService,
            GymsService,
            WallsService,
            RoutesService,
            LoginService
        ) {
            'use strict';

            FastClick.attach(document.body);

            // Set the global chart colors used throughout the site
            Chart.defaults.global.colours[0].fillColor = "rgba(237, 109, 86, 1)";
            Chart.defaults.global.colours[0].strokeColor = "rgba(237, 109, 86, 0.5)";
            Chart.defaults.global.colours[0].pointColor = "rgba(237, 109, 86, 0.5)";

            $rootScope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 20,
                animation: false
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

            $rootScope.navigateToHome = function () {
                $location.path('login');
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

            $rootScope.navigateToCreateRoute = function (pGymId, pWallId) {
                $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/routes/create');
            };

            $rootScope.navigateToSetters = function (pGymId) {
                $location.path('gyms/' + pGymId + '/setters');
            };

            $rootScope.navigateToRoute = function (pGymId, pWallId, pRouteId) {
                $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/routes/' + pRouteId);
            };

            $rootScope.navigateToEditRoute = function (pGymId, pWallId, pRouteId) {
                $location.path('gyms/' + pGymId + '/walls/' + pWallId + '/routes/' + pRouteId + '/edit');
            };

            $rootScope.navigateToUser = function (pUserId) {
                $location.path('users/' + pUserId);
            };

            $rootScope.navigateToSetters = function (pGymId) {
                $location.path('gyms/' + pGymId + '/setters');
            };

            $rootScope.navigateToSuggestionsPage = function () {
                $location.path('suggestions');
            };

            $rootScope.navigateToRouteManager = function (pGymId) {
                $location.path('gyms/' + pGymId + '/routes');
            };

            $rootScope.navigateToBlog = function () {
                $location.path('blog');
            };

            $rootScope.navigateToGymSuggestions = function (pGymId) {
                $location.path('gyms/' + pGymId + '/suggestions');
            };

            $rootScope.navigateToAlerts = function (pGymId) {
                $location.path('gyms/' + pGymId + '/alerts');
            };

            $rootScope.navigateToAddSetter = function (pGymId) {
                $location.path('gyms/' + pGymId + '/setters/add');
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
                LoginService.setImageUrlFromCookie();
                LoginService.setNameFromCookie();
            }

            $rootScope.formatGrade = function (pBoulderGrade, pRopeGrade) {
                return pBoulderGrade || pRopeGrade || 'Not Rated';
            };

            var paths = ['/'],
                gymsReg = /gyms\/([0-9]+)$/,
                gymId,
                nothing,
                userId;

            $rootScope.$on('$routeChangeSuccess', function () {
                $rootScope.lastPath = paths[0];
                paths.push($location.$$path);
                paths.splice(0, 1);
            });

            $rootScope.pageWasBookmarked = function () {
                return $rootScope.lastPath === '/';
            };

            $rootScope.lastPageWasZone = function () {
                return $rootScope.lastPath.indexOf('walls') !== -1;
            };

            $rootScope.lastPageWasUser = function () {
                return $rootScope.lastPath.indexOf('users') !== -1;
            };

            $rootScope.lastPageWasGym = function () {
                return $rootScope.lastPath.match(gymsReg) !== null;
            };

            $rootScope.lastPageWasRoute = function () {
                return $rootScope.lastPath.indexOf('routes') !== -1;
            };

            $rootScope.lastPageWasSetters = function () {
                return $rootScope.lastPath.indexOf('setters') !== -1;
            };

            if (LoginService.isLoggedIn()) {
                gymId = LoginService.getHomeGymId() || LoginService.getAccountId();
                nothing = function () {
                    return undefined;
                };
                userId = null;

                GymsService.getGyms(nothing);
                GymsService.getGym(gymId, nothing);
                GymsService.getGymImage(gymId, nothing);
                GymsService.getHomeGymUsers(gymId, nothing);
                RoutesService.getCurrentBoulderRoutes(gymId, nothing);
                RoutesService.getCurrentRopeRoutes(gymId, nothing);
                WallsService.getWallsInGym(gymId, nothing);

                if ($rootScope.isUserAccount()) {
                    userId = LoginService.getAccountId();
                    nothing = function () {
                        return undefined;
                    };
                    UsersService.getUser(userId, nothing);
                    UsersService.getUserImage(userId, nothing);
                }
            }
        }]);
