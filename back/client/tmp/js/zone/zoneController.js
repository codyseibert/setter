module.exports = [
  '$scope', '$rootScope', '$stateParams', 'ZoneService', 'FileService', 'RouteService', function($scope, $rootScope, $stateParams, ZoneService, FileService, RouteService) {
    ZoneService.get($stateParams.zoneId).then(function(zone) {
      return $scope.zone = zone;
    });
    $scope.upload = function(file, key) {
      return FileService.upload(file).then(function(data) {
        $scope.zone[key] = data;
        return ZoneService.update($scope.zone);
      });
    };
    RouteService.find({
      zoneId: $stateParams.zoneId
    }).then(function(routes) {
      return $scope.routes = routes;
    });
    $rootScope.$on('route.created', function(evt, route) {
      return $scope.routes.push(route);
    });
    $rootScope.$on('route.deleted', function(evt, route) {
      return $scope.routes.splice($scope.routes.indexOf(route), 1);
    });
    $scope.openEditRoutePanel = function() {
      return $rootScope.$broadcast('editroutepanel.show');
    };
    return $scope.openRoutePanel = function(route) {
      return $rootScope.$broadcast('routepanel.show', route);
    };
  }
];
