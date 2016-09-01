module.exports = [
  '$scope'
  '$stateParams'
  '$timeout'
  'GymAlertService'
  'GymService'
  (
    $scope
    $stateParams
    $timeout
    GymAlertService
    GymService
  ) ->

    $scope.creating = false
    $scope.alert = {}
    GymAlertService.find gymId: $stateParams.gymId
      .then (alerts) ->
        $scope.entries = alerts

    GymService.get $stateParams.gymId
      .then (gym) ->
        $scope.gym = gym
        $timeout ->
          FB.XFBML.parse()

    $scope.createNews = ->
      $scope.creating = !$scope.creating
      GymAlertService.create
        message: $scope.alert.message
        gymId: $stateParams.gymId
      .then (alert) ->
        $scope.entries.unshift alert

    $scope.cancel = ->
      $scope.creating = false

    $scope.edit = (entry) ->
      entry.editing = true

    $scope.cancelEntry = (entry) ->
      entry.editing = false

    $scope.save = (entry) ->
      GymAlertService.update entry
        .then ->
          entry.editing = false

    $scope.delete = (entry) ->
      isYes = confirm 'Are you sure you want to delete this news entry?'
      GymAlertService.delete entry
        .then ->
          $scope.entries.splice $scope.entries.indexOf(entry), 1 if isYes

]
