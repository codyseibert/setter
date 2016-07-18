module.exports = [
  '$scope'
  '$q'
  '$rootScope'
  '$stateParams'
  'ZoneService'
  'FileService'
  'RouteService'
  'SetterService'
  'BoulderGradesService'
  'RopeGradesService'
  'ColorService'
  (
    $scope
    $q
    $rootScope
    $stateParams
    ZoneService
    FileService
    RouteService
    SetterService
    BoulderGradesService
    RopeGradesService
    ColorService
  ) ->

    zoneMap = {}
    setterMap = {}
    boulderGradeMap = {}
    ropeGradeMap = {}
    colorMap = {}

    ZoneService.get $stateParams.zoneId
      .then (zone) ->
        $scope.zone = zone

    $scope.upload = (file, key) ->
      FileService.upload file
        .then (data) ->
          $scope.zone[key] = data
          ZoneService.update $scope.zone

    # RouteService.find zoneId: $stateParams.zoneId
    #   .then (routes) ->
    #     for route in routes
    #       $scope.gridOptions.data.push route

    $rootScope.$on 'route.created', (evt, route) ->
      $scope.routes.push route

    $rootScope.$on 'route.deleted', (evt, route) ->
      $scope.routes.splice $scope.routes.indexOf(route), 1

    $scope.openEditRoutePanel = (route) ->
      $rootScope.$broadcast 'editroutepanel.show', route

    $scope.openRoutePanel = (route) ->
      $rootScope.$broadcast 'routepanel.show', route

    isSelectEnabled = !$rootScope.isGymAdmin()
    $scope.gridOptions =
      enableFiltering: false
      enableColumnMenus: false
      enableRowHeaderSelection: isSelectEnabled
      enableRowSelection: isSelectEnabled
      enableSelectAll: isSelectEnabled
      onRegisterApi: (api) ->
        gridApi = api
      data: []
      columnDefs: [
        displayName: 'Color'
        field: 'color'
      ,
        displayName: 'Grade'
        field: 'grade'
      ,
        displayName: 'Setter'
        field: 'setter'
      ,
        displayName: 'Date Set'
        field: 'createdAt'
        cellTemplate: '<span>{{row.entity | amCalendar:referenceTime:formats}}</span>'
      ,
        displayName: 'Rating'
        field: 'createdAt'
        cellTemplate: '<span>*****</span>'
      ,
        displayName: 'Sent'
        field: 'createdAt'
        cellTemplate: '<span>sent</span>'
      ,
        displayName: 'Edit'
        field: 'edit'
        enableSorting: false
        enableFiltering: false
        cellTemplate: '<a ng-click="grid.appScope.openEditRoutePanel(row.entity)">Edit</a>'
      ,
        displayName: 'Show'
        field: 'show'
        enableSorting: false
        enableFiltering: false
        cellTemplate: '<a ng-click="grid.appScope.openRoutePanel(row.entity)">Show</a>'
      ]

    $q.all [
      SetterService.find gymId: $stateParams.gymId
      RouteService.find zoneId: $stateParams.zoneId
      ZoneService.find gymId: $stateParams.gymId
      BoulderGradesService.find()
      RopeGradesService.find()
      ColorService.find()
    ]
    .then (res) ->
      setters = res[0]
      routes = res[1]
      zones = res[2]
      boulderGrades = res[3]
      ropeGrades = res[4]
      colors = res[5]

      setterMap[setter.id] = "#{setter.firstname} #{setter.lastname}" for setter in setters
      boulderGradeMap[grade.id] = grade.name for grade in boulderGrades
      ropeGradeMap[grade.id] = grade.name for grade in ropeGrades
      colorMap[color.id] = color for color in colors
      zoneMap[zone.id] = zone.name for zone in zones
      routes.forEach (route) ->
        route.zone = zoneMap[route.zoneId]
        route.setter = setterMap[route.setterId]
        route.color = colorMap[route.colorId].name
        route.colorValue = colorMap[route.colorId].value
        route.grade = if route.type is 0 then boulderGradeMap[route.gradeId] else ropeGradeMap[route.gradeId]
        $scope.gridOptions.data.push route

]
