module.exports = [
  '$rootScope', '$state', '$stateParams', 'ColorService', 'RouteService', 'ZoneService', 'SetterService', 'BoulderGradesService', 'RopeGradesService', function($rootScope, $state, $stateParams, ColorService, RouteService, ZoneService, SetterService, BoulderGradesService, RopeGradesService) {
    return {
      restrict: 'E',
      scope: {},
      link: function(scope, elem, attr) {
        var routeToStrip;
        routeToStrip = null;
        scope.strip = function() {
          return RouteService["delete"](routeToStrip).then(function(route) {
            scope.show = false;
            return $rootScope.$broadcast('route.deleted', routeToStrip);
          });
        };
        return $rootScope.$on('routepanel.show', function(evt, route) {
          scope.show = true;
          routeToStrip = route;
          ZoneService.get($stateParams.zoneId).then(function(zone) {
            return scope.zone = zone;
          });
          RouteService.get(route.id).then(function(route) {
            return scope.route = route;
          });
          SetterService.get(route.setterId).then(function(setter) {
            return scope.setter = setter;
          });
          if (route.type === 0) {
            console.log('route', route);
            BoulderGradesService.get(route.gradeId).then(function(grade) {
              console.log(grade);
              return scope.grade = grade;
            });
          } else {
            RopeGradesService.get(route.gradeId).then(function(grade) {
              console.log('rope', grade);
              return scope.grade = grade;
            });
          }
          return ColorService.get(route.colorId).then(function(color) {
            return scope.color = color;
          });
        });
      },
      templateUrl: 'components/routepanel/template.html'
    };
  }
];
