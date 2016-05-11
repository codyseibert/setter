module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ColorService'
  'RouteService'
  'ZoneService'
  'BoulderGradesService'
  'RopeGradesService'
  'SetterService'
  (
    $rootScope
    $state
    $stateParams
    ColorService
    RouteService
    ZoneService
    BoulderGradesService
    RopeGradesService
    SetterService
  ) ->

    restrict: 'E'

    scope: {}

    link: (scope, elem, attr) ->

      scope.route = {}

      $rootScope.$on 'editroutepanel.show', ->
        scope.show = true

        ZoneService.get $stateParams.zoneId
          .then (zone) ->
            scope.zone = zone

      scope.types = [
        name: 'Bouldering'
        id: 0
      ,
        name: 'Top Rope'
        id: 1
      ,
        name: 'Lead'
        id: 2
      ]
      scope.route.type = scope.types[0]

      ColorService.find()
        .then (colors) ->
          scope.colors = colors
          scope.route.colorId = colors[0].id

      BoulderGradesService.find()
        .then (grades) ->
          scope.boulderGrades = grades
          scope.route.grade = scope.boulderGrades[0] if scope.route.type.id is 0

      RopeGradesService.find()
        .then (grades) ->
          scope.ropeGrades = grades
          scope.route.grade = scope.ropeGrades[0] if scope.route.type.id isnt 0

      SetterService.find gymId: $stateParams.gymId
        .then (setters) ->
          setters.forEach (setter) -> setter.name = "#{setter.firstname} #{setter.lastname}"
          scope.setters = setters
          scope.route.setter = scope.setters[0]

      scope.submit = ->
        scope.route.type = scope.route.type.id
        scope.route.gradeId = scope.route.grade.id
        scope.route.setterId = scope.route.setter.id
        scope.route.zoneId = $stateParams.zoneId
        RouteService.create scope.route
          .then (route) ->
            $rootScope.$broadcast 'route.created', route
            scope.show = false

    templateUrl: 'components/editroutepanel/template.html'

]
