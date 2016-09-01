var angular, app;

angular = require('angular');

require('angular-scroll');

require('angular-filter');

require('angular-local-storage');

require('angular-animate');

require('angular-chart.js');

require('ng-lodash');

require('angular-jwt');

require('angular-toggle-switch');

require('../../node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls');

require('../../node_modules/angular-ui-grid/ui-grid');

require('angular-scroll');

app = require('angular').module('setter', [require('angular-ui-router'), require('angular-resource'), require('angular-sanitize'), require('angular-moment'), require('ng-file-upload'), 'ngAnimate', 'duScroll', 'angular.filter', 'LocalStorageModule', 'ngLodash', 'ui.grid', 'ui.grid.selection', 'ui.bootstrap', 'toggle-switch', 'duScroll', 'chart.js', 'angular-jwt']);

app.constant('BASE_URL', "http://localhost:8081");

app.value('duScrollDuration', 500);

app.value('duScrollOffset', 80);

app.config(require('./routes'));

app.config([
  'localStorageServiceProvider', '$httpProvider', function(localStorageServiceProvider, $httpProvider) {
    $httpProvider.interceptors.push('APIInterceptor');
    return localStorageServiceProvider.setPrefix('setter');
  }
]);

require('./gyms');

require('./findgym');

require('./finduser');

require('./community');

require('./login');

require('./logout');

require('./info');

require('./viewroutes');

require('./analytics');

require('./members');

require('./landing');

require('./manageroutes');

require('./register');

require('./news');

require('./profile');

require('./setters');

require('./settings');

require('./zone');

require('./zones');

require('./models');

require('./services');

require('./components');

app.run([
  '$rootScope', '$http', '$state', '$location', '$stateParams', 'LoginService', 'localStorageService', function($rootScope, $http, $state, $location, $stateParams, LoginService, localStorageService) {
    var last;
    $rootScope.$on("$locationChangeSuccess", function(event, absNewUrl, absOldUrl) {
      return localStorageService.set('lastPath', $location.path());
    });
    $rootScope.isLoggedIn = function() {
      return LoginService.user != null;
    };
    $rootScope.accountId = function() {
      var ref;
      return (ref = LoginService.user) != null ? ref.id : void 0;
    };
    $rootScope.hasHomeGymId = function() {
      var ref;
      return ((ref = LoginService.user) != null ? ref.homeGymId : void 0) != null;
    };
    $rootScope.getHomeGymId = function() {
      var ref;
      return (ref = LoginService.user) != null ? ref.homeGymId : void 0;
    };
    $rootScope.isGymAccount = function() {
      var ref;
      return !!((ref = LoginService.user) != null ? ref.isGymAccount : void 0);
    };
    $rootScope.isGymAdmin = function() {
      return $rootScope.isGymAccount() && $stateParams.gymId === ("" + LoginService.user.id);
    };
    if ($rootScope.isLoggedIn()) {
      last = localStorageService.get('lastPath');
      if (last != null) {
        return $location.path(last);
      } else {
        if ($rootScope.isGymAccount()) {
          return $state.go('gyms.news', {
            gymId: LoginService.user.id
          });
        } else {
          return $state.go('profile', {
            userId: LoginService.user.id
          });
        }
      }
    }
  }
]);
