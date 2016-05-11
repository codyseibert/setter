module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ColorService'
  'RouteService'
  'ZoneService'
  'SetterService'
  'BoulderGradesService'
  'RopeGradesService'
  (
    $rootScope
    $state
    $stateParams
    ColorService
    RouteService
    ZoneService
    SetterService
    BoulderGradesService
    RopeGradesService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, elem, attr) ->
      routeToStrip = null

      scope.strip = ->
        RouteService.delete routeToStrip
          .then (route) ->
            scope.show = false
            $rootScope.$broadcast 'route.deleted', routeToStrip

      $rootScope.$on 'routepanel.show', (evt, route) ->
        scope.show = true
        routeToStrip = route

        ZoneService.get $stateParams.zoneId
          .then (zone) ->
            scope.zone = zone

        RouteService.get route.id
          .then (route) ->
            scope.route = route

        SetterService.get route.setterId
          .then (setter) ->
            scope.setter = setter

        if route.type is 0
          console.log 'route', route
          BoulderGradesService.get route.gradeId
            .then (grade) ->
              console.log grade
              scope.grade = grade
        else
          RopeGradesService.get route.gradeId
            .then (grade) ->
              console.log 'rope', grade
              scope.grade = grade

        ColorService.get route.colorId
          .then (color) ->
            scope.color = color


    templateUrl: 'components/routepanel/template.html'

]
