module.exports = [
  '$scope'
  '$rootScope'
  '$stateParams'
  'ZoneService'
  'FileService'
  'RouteService'
  (
    $scope
    $rootScope
    $stateParams
    ZoneService
    FileService
    RouteService
  ) ->

    ZoneService.get $stateParams.zoneId
      .then (zone) ->
        $scope.zone = zone

    $scope.upload = (file, key) ->
      FileService.upload file
        .then (data) ->
          $scope.zone[key] = data
          ZoneService.update $scope.zone

    RouteService.find zoneId: $stateParams.zoneId
      .then (routes) ->
        $scope.routes = routes

    $rootScope.$on 'route.created', (evt, route) ->
      $scope.routes.push route

    $rootScope.$on 'route.deleted', (evt, route) ->
      $scope.routes.splice $scope.routes.indexOf(route), 1

    $scope.openEditRoutePanel = ->
      $rootScope.$broadcast 'editroutepanel.show'

    $scope.openRoutePanel = (route) ->
      $rootScope.$broadcast 'routepanel.show', route

]
