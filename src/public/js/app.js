/*global angular: false, btoa: false, Chart: false, confirm: false, FastClick: false, console: false */

angular.module('SETTER', [
    'ngRoute',
    'ngCookies',
    'ngAnimate',
    'ngUpload',
    'chart.js',
    'pasvaz.bindonce',
    'angularSpinner',
    'smoothScroll'])
    .config([
        '$routeProvider',
        function (
            $routeProvider
        ) {
            'use strict';

            $routeProvider
                .when('/', {
                    controller: 'SplashController',
                    templateUrl: 'templates/Splash.tpl.html'
                })
                .when('/login', {
                    controller: 'LoginController',
                    templateUrl: 'templates/Login.tpl.html'
                })
                .when('/logout', {
                    controller: 'LogoutController',
                    templateUrl: 'templates/Logout.tpl.html'
                })
                .when('/blog', {
                    controller: 'BlogController',
                    templateUrl: 'templates/Blog.tpl.html'
                })
                .when('/settings', {
                    controller: 'AccountSettingsController',
                    templateUrl: 'templates/AccountSettings.tpl.html'
                })
                .when('/password/reset', {
                    controller: 'PasswordResetController',
                    templateUrl: 'templates/PasswordReset.tpl.html'
                })
                .when('/gym/register', {
                    controller: 'RegisterGymController',
                    templateUrl: 'templates/RegisterGym.tpl.html'
                })
                .when('/user/register', {
                    controller: 'RegisterUserController',
                    templateUrl: 'templates/RegisterUser.tpl.html'
                })
                .when('/gyms', {
                    controller: 'GymsController',
                    templateUrl: 'templates/Gyms.tpl.html'
                })
                .when('/gyms/:gymId/suggestions', {
                    controller: 'GymSuggestionsController',
                    templateUrl: 'templates/GymSuggestions.tpl.html'
                })
                .when('/gyms/:gymId', {
                    controller: 'GymController',
                    templateUrl: 'templates/gym/Gym.tpl.html'
                })
                .when('/gyms/:gymId/alerts', {
                    controller: 'AlertsController',
                    templateUrl: 'templates/Alerts.tpl.html'
                })
                .when('/gyms/:gymId/walls', {
                    controller: 'WallsController',
                    templateUrl: 'templates/Walls.tpl.html'
                })
                .when('/gyms/:gymId/walls/:wallId', {
                    controller: 'WallController',
                    templateUrl: 'templates/Wall.tpl.html'
                })
                .when('/gyms/:gymId/walls/:wallId/routes/create', {
                    controller: 'CreateRouteController',
                    templateUrl: 'templates/CreateRoute.tpl.html',
                    resolve: {
                        isEditMode: function () {
                            return false;
                        }
                    }
                })
                .when('/gyms/:gymId/walls/:wallId/routes/:routeId/edit', {
                    controller: 'CreateRouteController',
                    templateUrl: 'templates/CreateRoute.tpl.html',
                    resolve: {
                        isEditMode: function () {
                            return true;
                        }
                    }
                })
                .when('/gyms/:gymId/walls/:wallId/routes/:routeId', {
                    controller: 'RouteController',
                    templateUrl: 'templates/Route.tpl.html'
                })
                .when('/gyms/:gymId/setters', {
                    controller: 'SettersController',
                    templateUrl: 'templates/Setters.tpl.html'
                })
                .when('/gyms/:gymId/setters/add', {
                    controller: 'AddSetterController',
                    templateUrl: 'templates/AddSetter.tpl.html'
                })
                .when('/gyms/:gymId/routes', {
                    controller: 'RouteManagerController',
                    templateUrl: 'templates/RouteManager.tpl.html'
                })
                .when('/users/:userId', {
                    controller: 'UserController',
                    templateUrl: 'templates/user/User.tpl.html'
                })
                .when('/suggestions', {
                    controller: 'SuggestionsController',
                    templateUrl: 'templates/Suggestions.tpl.html'
                })
                .when('/contact', {
                    controller: 'ContactController',
                    templateUrl: 'templates/Contact.tpl.html'
                })
                .when('/tos', {
                    controller: 'TOSController',
                    templateUrl: 'templates/TOS.tpl.html'
                })
                .otherwise({
                    redirectTo: '/'
                });
        }])
    .run([
        '$rootScope',
        '$location',
        '$window',
        '$timeout',
        'UsersService',
        'GymsService',
        'WallsService',
        'RoutesService',
        'LoginService',
        function (
            $rootScope,
            $location,
            $window,
            $timeout,
            UsersService,
            GymsService,
            WallsService,
            RoutesService,
            LoginService
        ) {
            'use strict';

            // Add to string prototype to do sprintf
            if (!String.prototype.format) {
                String.prototype.format = function () {
                    var args = arguments;

                    return this.replace(/\{(\d+)\}/g, function (match, number) {
                        if (args[number] === 'undefined') {
                            return match;
                        }
                        return args[number];
                    });
                };
            }

            FastClick.attach(document.body);

            // Set the global chart colors used throughout the site
            Chart.defaults.global.colours[0].fillColor = "#AECB83";
            Chart.defaults.global.colours[0].strokeColor = "#A3BF7C";
            Chart.defaults.global.colours[0].pointColor = "rgba(237, 109, 86, 0.5)";
            Chart.defaults.global.colours[0].pointColor = "rgba(237, 109, 86, 0.5)";

            $rootScope.chartOptions = {
                scaleFontColor: "#000",
                scaleFontSize: 12,
                animation: false
            };

            $rootScope.UNRATED_STRING = "Unrated";

            $rootScope.navigateToLogin = function () {
                $location.path('login');
            };

            $rootScope.navigateToSettings = function () {
                $location.path('settings');
            };

            $rootScope.navigateToPasswordReset = function () {
                $location.path('password/reset');
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

            $rootScope.navigateToAccountSettings = function () {
                $location.path('settings');
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

            $rootScope.navigateToAddSetters = function (pGymId) {
                $location.path('gyms/' + pGymId + '/setters/add');
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
                LoginService.setGymNameFromCookie();
                $rootScope.imageUrl = LoginService.getImageUrl();
            }

            $rootScope.getAccountName = function () {
                return LoginService.getName();
            };

            $rootScope.formatGrade = function (pBoulderGrade, pTopRopeGrade, pLeadGrade) {
                return pBoulderGrade || pTopRopeGrade || pLeadGrade || 'Not Rated';
            };

            var paths = ['/'],
                userReg = /users\/[0-9]+$/,
                settersReg = /gyms\/[0-9]+\/setters$/,
                gymsReg = /gyms\/[0-9]+$/,
                zonesReg = /gyms\/[0-9]+\/walls$/,
                zoneReg = /gyms\/[0-9]+\/walls\/[0-9]+$/,
                routeReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes\/[0-9]+$/,
                routesReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes$/,
                editRouteReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes\/[0-9]+\/edit$/,
                gymId,
                nothing,
                userId;

            $rootScope.$on('$routeChangeSuccess', function () {
                var currentPath,
                    lastPath;
                currentPath = $location.$$path;
                lastPath = paths[0];
                $rootScope.lastPath = lastPath;
                paths.push(currentPath);
                paths.splice(0, 1);

                // Always slide right (handles back logic)
                $rootScope.slideLeft = false;

                if ($rootScope.currentPageIsZones() && $rootScope.lastPageWasGyms()) {
                    $rootScope.slideLeft = true;
                }

                if ($rootScope.currentPageIsZone() && $rootScope.lastPageWasZones()) {
                    $rootScope.slideLeft = true;
                }

                if ($rootScope.currentPageIsRoute() && $rootScope.lastPageWasZone()) {
                    $rootScope.slideLeft = true;
                }

                if ($rootScope.currentPageIsEditRoute() && $rootScope.lastPageWasRoute()) {
                    $rootScope.slideLeft = true;
                }
            });

            $rootScope.pageWasBookmarked = function () {
                return $rootScope.lastPath === '/';
            };

            // Current Page Check Logic
            $rootScope.currentPageIsRouteArchive = function () {
                return $location.$$path.match(routesReg);
            };

            $rootScope.currentPageIsGyms = function () {
                return $location.$$path.match(gymsReg);
            };

            $rootScope.currentPageIsZones = function () {
                return $location.$$path.match(zonesReg);
            };

            $rootScope.currentPageIsZone = function () {
                return $location.$$path.match(zoneReg);
            };

            $rootScope.currentPageIsRoute = function () {
                return $location.$$path.match(routeReg);
            };

            $rootScope.currentPageIsEditRoute = function () {
                return $location.$$path.match(editRouteReg);
            };

            $rootScope.currentPageIsUser = function () {
                return $location.$$path.match(userReg);
            };

            $rootScope.currentPageIsSetters = function () {
                return $location.$$path.match(settersReg);
            };




            // Last Page Check Logic
            $rootScope.lastPageWasRouteArchive = function () {
                return $rootScope.lastPath.match(routesReg) !== null;
            };

            $rootScope.lastPageWasGyms = function () {
                return $rootScope.lastPath.match(gymsReg) !== null;
            };

            $rootScope.lastPageWasZones = function () {
                return $rootScope.lastPath.match(zonesReg) !== null;
            };

            $rootScope.lastPageWasZone = function () {
                return $rootScope.lastPath.match(zoneReg) !== null;
            };

            $rootScope.lastPageWasRoute = function () {
                return $rootScope.lastPath.match(routeReg) !== null;
            };

            $rootScope.lastPageWasEditRoute = function () {
                return $rootScope.lastPath.match(editRouteReg) !== null;
            };

            $rootScope.lastPageWasUser = function () {
                return $rootScope.lastPath.match(userReg) !== null;
            };

            $rootScope.lastPageWasSetters = function () {
                return $rootScope.lastPath.match(settersReg) !== null;
            };






            $rootScope.getGymImageSrc = function (pData) {
                if (!pData || !pData.url || pData.url === '') {
                    return 'images/no_gym_image.png';
                }
                return pData.url;
            };

            $rootScope.getUserImageSrc = function (pData) {
                if (!pData || !pData.url || pData.url === '') {
                    return 'images/no_image.png';
                }
                return pData.url;
            };

            $rootScope.getImageUrlString = function () {
                return "url(" + LoginService.getImageUrl() + ")";
            };


            /*
                Used for forcing the data to be loaded directly up front and cached.
            */
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
                RoutesService.getCurrentTopRopeRoutes(gymId, nothing);
                RoutesService.getCurrentLeadRoutes(gymId, nothing);

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

            /*
                Very nasty hack to get the charts to display...
            */
            $rootScope.refreshCharts = function () {
                $timeout(function () {
                    $rootScope.$apply();
                }, 10);

                $timeout(function () {
                    $rootScope.$apply();
                }, 100);

                $timeout(function () {
                    $rootScope.$apply();
                }, 1000);
            };
        }]);
