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

    $scope.discussion = {}
    $scope.discussion.gymId = $stateParams.gymId
    $scope.discussion.accountId = LoginService.user.id
    $scope.discussion.type = DISCUSSION

    $scope.gear = {}
    $scope.gear.gymId = $stateParams.gymId
    $scope.gear.accountId = LoginService.user.id
    $scope.gear.type = GEAR

    $scope.deleteDiscussion = (discussion) ->
      isYes = confirm 'are you sure you want to delete this discussion post?'
      return if not isYes
      DiscussionService.delete discussion
        .then ->
          $scope.discussions.splice $scope.discussions.indexOf(discussion), 1

    $scope.deleteGear = (gear) ->
      isYes = confirm 'are you sure you want to delete this gear post?'
      return if not isYes
      DiscussionService.delete gear
        .then ->
          $scope.gears.splice $scope.gears.indexOf(gear), 1

    $scope.ownsDiscussion = (discussion) ->
      LoginService.user.id is discussion.accountId

    $scope.updateDiscussion = (discussion) ->
      DiscussionService.update discussion
        .then ->
          discussion.creating = false

    $scope.updateGear = (gear) ->
      DiscussionService.update gear
        .then ->
          gear.creating = false

    $scope.saveDiscussion = ->
      DiscussionService.create $scope.discussion
        .then (discussion) ->
          $scope.discussions.push discussion
          $scope.creatingDiscussion = false

    $scope.saveGear = ->
      DiscussionService.create $scope.gear
        .then (gear) ->
          $scope.gears.push gear
          $scope.creatingGear = false

    DiscussionService.find gymId: $stateParams.gymId
      .then (discussions) ->
        $scope.discussions = _.filter discussions, type: DISCUSSION
        $scope.gears = _.filter discussions, type: GEAR

]
