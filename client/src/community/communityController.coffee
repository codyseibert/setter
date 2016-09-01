module.exports = [
  '$scope'
  '$stateParams'
  'DiscussionService'
  'LoginService'
  'lodash'
  (
    $scope
    $stateParams
    DiscussionService
    LoginService
    _
  ) ->

    DISCUSSION = 0
    GEAR = 1

    $scope.discussions = []
    $scope.gears = []

    DiscussionService.find gymId: $stateParams.gymId
      .then (entries) ->
        _.each _.filter(entries, type: DISCUSSION), (discussion) ->
          $scope.discussions.push discussion

        _.each _.filter(_.filter entries, type: GEAR), (gear) ->
          console.log gear
          $scope.gears.push gear

]
