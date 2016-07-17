module.exports = [
  '$scope'
  '$state'
  '$stateParams'
  'ZoneService'
  (
    $scope
    $state
    $stateParams
    ZoneService
  ) ->

    $scope.form = {}
    $scope.form.gymId = $stateParams.gymId

    ZoneService.find gymId: $stateParams.gymId
      .then (zones) ->
        $scope.zones = zones

    $scope.submit = ->
      ZoneService.create $scope.form
        .then (zone) ->
          $scope.zones.push zone

]
