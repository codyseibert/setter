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
      discussions: '='

    link: (scope, elem, attr) ->
      DISCUSSION = 0

      scope.discussion = {}
      scope.discussion.gymId = $stateParams.gymId
      scope.discussion.accountId = LoginService.user.id
      scope.discussion.type = DISCUSSION

      scope.deleteDiscussion = (discussion) ->
        isYes = confirm 'are you sure you want to delete this discussion post?'
        return if not isYes
        DiscussionService.delete discussion
          .then ->
            scope.discussions.splice scope.discussions.indexOf(discussion), 1

      scope.ownsDiscussion = (discussion) ->
        LoginService.user.id is discussion.accountId

      scope.updateDiscussion = (discussion) ->
        DiscussionService.update discussion
          .then ->
            discussion.creating = false

      scope.saveDiscussion = ->
        DiscussionService.create scope.discussion
          .then (discussion) ->
            scope.discussions.push discussion
            scope.creatingDiscussion = false

    templateUrl: 'community/notifications/notifications.html'

]
