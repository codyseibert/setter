module.exports = [
  '$rootScope', '$state', '$stateParams', 'ZoneService', 'RouteService', function($rootScope, $state, $stateParams, ZoneService, RouteService) {
    return {
      restrict: 'E',
      scope: {},
      link: function(scope, elem, attr) {
        ZoneService.get($stateParams.zoneId).then(function(zone) {
          return scope.zone = zone;
        });
        RouteService.find({
          zoneId: $stateParams.zoneId
        }).then(function(routes) {
          return scope.routes = routes;
        });
        $rootScope.$on('route.created', function(evt, route) {
          return scope.routes.push(route);
        });
        $rootScope.$on('route.deleted', function(evt, route) {
          return scope.routes.splice(scope.routes.indexOf(route), 1);
        });
        scope.openEditRoutePanel = function() {
          return $rootScope.$broadcast('editroutepanel.show');
        };
        return scope.openRoutePanel = function(route) {
          return $rootScope.$broadcast('routepanel.show', route);
        };
      },
      templateUrl: 'components/zone/template.html'
    };
  }
];
