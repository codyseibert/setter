module.exports = [
  '$scope', '$rootScope', '$q', '$stateParams', 'RouteService', 'SetterService', 'ColorService', 'BoulderGradesService', 'RopeGradesService', 'RatingService', 'ZoneService', function($scope, $rootScope, $q, $stateParams, RouteService, SetterService, ColorService, BoulderGradesService, RopeGradesService, RatingService, ZoneService) {
    var boulderGradeMap, colorMap, gridApi, ropeGradeMap, setterMap, zoneMap;
    gridApi = null;
    zoneMap = {};
    setterMap = {};
    boulderGradeMap = {};
    ropeGradeMap = {};
    colorMap = {};
    $scope.stripSelected = function(routes) {
      var d, i, len, results, row, rows;
      rows = gridApi.selection.getSelectedRows();
      d = $scope.gridOptions.data;
      results = [];
      for (i = 0, len = rows.length; i < len; i++) {
        row = rows[i];
        console.log(row);
        results.push(RouteService["delete"](row).then(function() {
          return d.splice(d.indexOf(row), 1);
        }));
      }
      return results;
    };
    $scope.openEditRoutePanel = function(route) {
      return $rootScope.$broadcast('editroutepanel.show', route);
    };
    $scope.gridOptions = {
      enableFiltering: true,
      enableColumnMenus: false,
      enableRowSelection: true,
      enableSelectAll: true,
      onRegisterApi: function(api) {
        return gridApi = api;
      },
      data: [],
      columnDefs: [
        {
          displayName: 'Zone',
          field: 'zone'
        }, {
          displayName: 'Color',
          field: 'color'
        }, {
          displayName: 'Grade',
          field: 'grade'
        }, {
          displayName: 'Setter',
          field: 'setter'
        }, {
          displayName: 'Type',
          field: 'type'
        }, {
          displayName: 'Date Set',
          field: 'createdAt'
        }, {
          displayName: 'Edit',
          field: 'edit',
          enableSorting: false,
          enableFiltering: false,
          cellTemplate: '<a ng-click="grid.app$scope.openEditRoutePanel(row.entity)">Edit</a>'
        }
      ]
    };
    return $q.all([
      SetterService.find({
        gymId: $stateParams.gymId
      }), ZoneService.find({
        gymId: $stateParams.gymId
      }), BoulderGradesService.find(), RopeGradesService.find(), ColorService.find()
    ]).then(function(res) {
      var boulderGrades, color, colors, grade, i, j, k, l, len, len1, len2, len3, len4, m, ropeGrades, setter, setters, zone, zones;
      setters = res[0];
      zones = res[1];
      boulderGrades = res[2];
      ropeGrades = res[3];
      colors = res[4];
      for (i = 0, len = setters.length; i < len; i++) {
        setter = setters[i];
        setterMap[setter.id] = setter.firstname + " " + setter.lastname;
      }
      for (j = 0, len1 = boulderGrades.length; j < len1; j++) {
        grade = boulderGrades[j];
        boulderGradeMap[grade.id] = grade.name;
      }
      for (k = 0, len2 = ropeGrades.length; k < len2; k++) {
        grade = ropeGrades[k];
        ropeGradeMap[grade.id] = grade.name;
      }
      for (l = 0, len3 = colors.length; l < len3; l++) {
        color = colors[l];
        colorMap[color.id] = color;
      }
      for (m = 0, len4 = zones.length; m < len4; m++) {
        zone = zones[m];
        zoneMap[zone.id] = zone.name;
      }
      return RouteService.find({
        'zoneId~in': (zones.map(function(zone) {
          return zone.id;
        })).join(',')
      }).then(function(routes) {
        return routes.forEach(function(route) {
          route.zone = zoneMap[route.zoneId];
          route.setter = zoneMap[route.setterId];
          route.color = colorMap[route.colorId].name;
          route.colorValue = colorMap[route.colorId].value;
          route.grade = route.type === 0 ? boulderGradeMap[route.gradeId] : ropeGradeMap[route.gradeId];
          return $scope.gridOptions.data.push(route);
        });
      });
    });
  }
];
