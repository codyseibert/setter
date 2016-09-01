module.exports = [
  '$rootScope'
  '$q'
  '$stateParams'
  'DiscussionService'
  'LoginService'
  (
    $rootScope
    $q
    $stateParams
    DiscussionService
    LoginService
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

      scope.creating = false

      scope.create = ->
        scope.creating = true

      scope.save = ->
        DiscussionService.create scope.gear
          .then (gear) ->
            scope.gears.push gear
            scope.creating = false

      scope.cancel = ->
        scope.creating = false

    templateUrl: 'community/gears/gearsBlankState.html'

]
