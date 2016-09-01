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
      discussions: '='

    link: (scope, elem, attr) ->
      DISCUSSION = 0
      scope.discussion = {}
      scope.discussion.gymId = $stateParams.gymId
      scope.discussion.accountId = LoginService.user.id
      scope.discussion.type = DISCUSSION

      scope.creating = false

      scope.create = ->
        scope.creating = true

      scope.save = ->
        DiscussionService.create scope.discussion
          .then (discussion) ->
            scope.discussions.push discussion
            scope.creating = false

      scope.cancel = ->
        scope.creating = false

    templateUrl: 'community/notifications/notificationsBlankState.html'

]
