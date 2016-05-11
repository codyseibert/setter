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

    link: (scope, elem, attr) ->

      ZoneService.get $stateParams.zoneId
        .then (zone) ->
          scope.zone = zone

      RouteService.find zoneId: $stateParams.zoneId
        .then (routes) ->
          scope.routes = routes

      #
      # scope.submit = ->
      #   ZoneService.create scope.form
      #     .then (zone) ->
      #       scope.zones.push zone

    templateUrl: 'components/zone/template.html'

]
