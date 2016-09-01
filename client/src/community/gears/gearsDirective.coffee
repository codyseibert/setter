module.exports = [
  '$rootScope'
  '$q'
  '$stateParams'
  'DiscussionService'
  'LoginService'
  'lodash'
  (
    $rootScope
    $q
    $stateParams
    DiscussionService
    LoginService
    _
  ) ->

    restrict: 'E'

    scope:
      gears: '='

    link: (scope, elem, attr) ->
      GEAR = 1

      scope.gear = {}
      scope.gear.gymId = $stateParams.gymId
      scope.gear.accountId = LoginService.user.id
      scope.gear.type = GEAR

      scope.delete = (gear) ->
        isYes = confirm 'are you sure you want to delete this gear post?'
        return if not isYes
        DiscussionService.delete gear
          .then ->
            scope.gears.splice scope.gears.indexOf(gear), 1

      scope.owns = (gear) ->
        LoginService.user.id is gear.accountId

      scope.update = (gear) ->
        DiscussionService.update gear
          .then ->
            gear.creating = false

      scope.save = ->
        DiscussionService.create scope.gear
          .then (gear) ->
            scope.gears.push gear
            scope.creating = false

    templateUrl: 'community/gears/gears.html'

]
