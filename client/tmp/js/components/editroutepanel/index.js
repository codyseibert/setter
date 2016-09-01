module.exports = [
  '$rootScope', '$state', '$stateParams', 'ColorService', 'RouteService', 'ZoneService', 'BoulderGradesService', 'RopeGradesService', 'SetterService', function($rootScope, $state, $stateParams, ColorService, RouteService, ZoneService, BoulderGradesService, RopeGradesService, SetterService) {
    return {
      restrict: 'E',
      scope: {},
      link: function(scope, elem, attr) {
        scope.route = {};
        $rootScope.$on('editroutepanel.show', function(route) {
          scope.show = true;
          ZoneService.get($stateParams.zoneId).then(function(zone) {
            return scope.zone = zone;
          });
          scope.types = [
            {
              name: 'Bouldering',
              id: 0
            }, {
              name: 'Top Rope',
              id: 1
            }, {
              name: 'Lead',
              id: 2
            }
          ];
          scope.route.type = scope.types[0];
          ColorService.find().then(function(colors) {
            scope.colors = colors;
            return scope.route.colorId = colors[0].id;
          });
          BoulderGradesService.find().then(function(grades) {
            scope.boulderGrades = grades;
            if (scope.route.type.id === 0) {
              return scope.route.grade = scope.boulderGrades[0];
            }
          });
          RopeGradesService.find().then(function(grades) {
            scope.ropeGrades = grades;
            if (scope.route.type.id !== 0) {
              return scope.route.grade = scope.ropeGrades[0];
            }
          });
          return SetterService.find({
            gymId: $stateParams.gymId
          }).then(function(setters) {
            setters.forEach(function(setter) {
              return setter.name = setter.firstname + " " + setter.lastname;
            });
            scope.setters = setters;
            return scope.route.setter = scope.setters[0];
          });
        });
        return scope.submit = function() {
          scope.route.type = scope.route.type.id;
          scope.route.gradeId = scope.route.grade.id;
          scope.route.setterId = scope.route.setter.id;
          scope.route.zoneId = $stateParams.zoneId;
          return RouteService.create(scope.route).then(function(route) {
            $rootScope.$broadcast('route.created', route);
            return scope.show = false;
          });
        };
      },
      templateUrl: 'components/editroutepanel/template.html'
    };
  }
];
