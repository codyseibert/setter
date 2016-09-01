module.exports = [
  '$scope'
  '$stateParams'
  'GymService'
  'FileService'
  (
    $scope
    $stateParams
    GymService
    FileService
  ) ->

    GymService.get $stateParams.gymId
      .then (gym) ->
        $scope.gym = gym
        $scope.gym.hideSetters = !!gym.hideSetters

    $scope.submit = ->
      GymService.update $scope.gym
        .then (gym) ->

    $scope.upload = (file, key) ->
      FileService.upload file
        .then (data) ->
          $scope.gym[key] = data
]
