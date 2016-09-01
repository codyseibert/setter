module.exports = [
  '$scope', '$q', '$rootScope', '$stateParams', 'ZoneService', 'FileService', 'RouteService', 'SetterService', 'BoulderGradesService', 'RopeGradesService', 'ColorService', function($scope, $q, $rootScope, $stateParams, ZoneService, FileService, RouteService, SetterService, BoulderGradesService, RopeGradesService, ColorService) {
    var boulderGradeMap, colorMap, isSelectEnabled, ropeGradeMap, setterMap, zoneMap;
    zoneMap = {};
    setterMap = {};
    boulderGradeMap = {};
    ropeGradeMap = {};
    colorMap = {};
    ZoneService.get($stateParams.zoneId).then(function(zone) {
      return $scope.zone = zone;
    });
    $scope.upload = function(file, key) {
      return FileService.upload(file).then(function(data) {
        $scope.zone[key] = data;
        return ZoneService.update($scope.zone);
      });
    };
    $rootScope.$on('route.created', function(evt, route) {
      return $scope.routes.push(route);
    });
    $rootScope.$on('route.deleted', function(evt, route) {
      return $scope.routes.splice($scope.routes.indexOf(route), 1);
    });
    $scope.openEditRoutePanel = function(route) {
      return $rootScope.$broadcast('editroutepanel.show', route);
    };
    $scope.openRoutePanel = function(route) {
      return $rootScope.$broadcast('routepanel.show', route);
    };
    isSelectEnabled = !$rootScope.isGymAdmin();
    $scope.gridOptions = {
      enableFiltering: false,
      enableColumnMenus: false,
      enableRowHeaderSelection: isSelectEnabled,
      enableRowSelection: isSelectEnabled,
      enableSelectAll: isSelectEnabled,
      onRegisterApi: function(api) {
        var gridApi;
        return gridApi = api;
      },
      data: [],
      columnDefs: [
        {
          displayName: 'Color',
          field: 'color'
        }, {
          displayName: 'Grade',
          field: 'grade'
        }, {
          displayName: 'Setter',
          field: 'setter'
        }, {
          displayName: 'Date Set',
          field: 'createdAt',
          cellTemplate: '<span>{{row.entity | amCalendar:referenceTime:formats}}</span>'
        }, {
          displayName: 'Rating',
          field: 'createdAt',
          cellTemplate: '<span>*****</span>'
        }, {
          displayName: 'Sent',
          field: 'createdAt',
          cellTemplate: '<span>sent</span>'
        }, {
          displayName: 'Edit',
          field: 'edit',
          enableSorting: false,
          enableFiltering: false,
          cellTemplate: '<a ng-click="grid.appScope.openEditRoutePanel(row.entity)">Edit</a>'
        }, {
          displayName: 'Show',
          field: 'show',
          enableSorting: false,
          enableFiltering: false,
          cellTemplate: '<a ng-click="grid.appScope.openRoutePanel(row.entity)">Show</a>'
        }
      ]
    };
    return $q.all([
      SetterService.find({
        gymId: $stateParams.gymId
      }), RouteService.find({
        zoneId: $stateParams.zoneId
      }), ZoneService.find({
        gymId: $stateParams.gymId
      }), BoulderGradesService.find(), RopeGradesService.find(), ColorService.find()
    ]).then(function(res) {
      var boulderGrades, color, colors, grade, i, j, k, l, len, len1, len2, len3, len4, m, ropeGrades, routes, setter, setters, zone, zones;
      setters = res[0];
      routes = res[1];
      zones = res[2];
      boulderGrades = res[3];
      ropeGrades = res[4];
      colors = res[5];
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
      return routes.forEach(function(route) {
        route.zone = zoneMap[route.zoneId];
        route.setter = setterMap[route.setterId];
        route.color = colorMap[route.colorId].name;
        route.colorValue = colorMap[route.colorId].value;
        route.grade = route.type === 0 ? boulderGradeMap[route.gradeId] : ropeGradeMap[route.gradeId];
        return $scope.gridOptions.data.push(route);
      });
    });
  }
];
