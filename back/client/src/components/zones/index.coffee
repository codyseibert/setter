module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ZoneService'
  (
    $rootScope
    $state
    $stateParams
    ZoneService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      scope.form = {}
      scope.form.gymId = $stateParams.gymId

      ZoneService.find gymId: $stateParams.gymId
        .then (zones) ->
          scope.zones = zones

      scope.submit = ->
        ZoneService.create scope.form
          .then (zone) ->
            scope.zones.push zone

    templateUrl: 'components/zones/template.html'

]
