module.exports = [
  '$rootScope'
  '$q'
  '$stateParams'
  'RouteService'
  'SetterService'
  'ColorService'
  'BoulderGradesService'
  'RopeGradesService'
  'RatingService'
  'ZoneService'
  (
    $rootScope
    $q
    $stateParams
    RouteService
    SetterService
    ColorService
    BoulderGradesService
    RopeGradesService
    RatingService
    ZoneService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, elem, attr) ->

      gridApi = null
      zoneMap = {}
      setterMap = {}
      boulderGradeMap = {}
      ropeGradeMap = {}
      colorMap = {}

      scope.stripSelected = (routes) ->
        rows = gridApi.selection.getSelectedRows()
        d = scope.gridOptions.data
        for row in rows
          console.log row
          RouteService.delete row
            .then ->
              d.splice d.indexOf(row), 1

      scope.openEditRoutePanel = (route) ->
        $rootScope.$broadcast 'editroutepanel.show', route

      scope.gridOptions =
        enableFiltering: true
        enableColumnMenus: false
        enableRowSelection: true
        enableSelectAll: true
        onRegisterApi: (api) ->
          gridApi = api
        data: []
        columnDefs: [
          displayName: 'Zone'
          field: 'zone'
        ,
          displayName: 'Color'
          field: 'color'
        ,
          displayName: 'Grade'
          field: 'grade'
        ,
          displayName: 'Setter'
          field: 'setter'
        ,
          displayName: 'Type'
          field: 'type'
        ,
          displayName: 'Date Set'
          field: 'createdAt'
        ,
          displayName: 'Edit'
          field: 'edit'
          enableSorting: false
          enableFiltering: false
          cellTemplate: '<a ng-click="grid.appScope.openEditRoutePanel(row.entity)">Edit</a>'
        ]

      $q.all [
        SetterService.find gymId: $stateParams.gymId
        ZoneService.find gymId: $stateParams.gymId
        BoulderGradesService.find()
        RopeGradesService.find()
        ColorService.find()
      ]
      .then (res) ->
        setters = res[0]
        zones = res[1]
        boulderGrades = res[2]
        ropeGrades = res[3]
        colors = res[4]

        setterMap[setter.id] = "#{setter.firstname} #{setter.lastname}" for setter in setters
        boulderGradeMap[grade.id] = grade.name for grade in boulderGrades
        ropeGradeMap[grade.id] = grade.name for grade in ropeGrades
        colorMap[color.id] = color for color in colors
        zoneMap[zone.id] = zone.name for zone in zones
        RouteService.find 'zoneId~in': (zones.map (zone) -> zone.id).join ','
          .then (routes) ->
            routes.forEach (route) ->
              route.zone = zoneMap[route.zoneId]
              route.setter = zoneMap[route.setterId]
              route.color = colorMap[route.colorId].name
              route.colorValue = colorMap[route.colorId].value
              route.grade = if route.type is 0 then boulderGradeMap[route.gradeId] else ropeGradeMap[route.gradeId]
              scope.gridOptions.data.push route

    templateUrl: 'components/manageroutes/template.html'

]
