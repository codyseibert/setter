module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ZoneService'
  'RouteService'
  (
    $rootScope
    $state
    $stateParams
    ZoneService
    RouteService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, elem, attr) ->

      ZoneService.get $stateParams.zoneId
        .then (zone) ->
          scope.zone = zone

      RouteService.find zoneId: $stateParams.zoneId
        .then (routes) ->
          scope.routes = routes

      $rootScope.$on 'route.created', (evt, route) ->
        scope.routes.push route

      $rootScope.$on 'route.deleted', (evt, route) ->
        scope.routes.splice scope.routes.indexOf(route), 1

      scope.openEditRoutePanel = ->
        $rootScope.$broadcast 'editroutepanel.show'

      scope.openRoutePanel = (route) ->
        $rootScope.$broadcast 'routepanel.show', route

    templateUrl: 'components/zone/template.html'

]
