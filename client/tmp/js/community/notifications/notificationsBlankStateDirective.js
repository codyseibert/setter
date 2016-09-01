module.exports = [
  '$rootScope', '$q', '$stateParams', 'DiscussionService', 'LoginService', function($rootScope, $q, $stateParams, DiscussionService, LoginService) {
    return {
      restrict: 'E',
      scope: {
        discussions: '='
      },
      link: function(scope, elem, attr) {
        var DISCUSSION;
        DISCUSSION = 0;
        scope.discussion = {};
        scope.discussion.gymId = $stateParams.gymId;
        scope.discussion.accountId = LoginService.user.id;
        scope.discussion.type = DISCUSSION;
        scope.creating = false;
        scope.create = function() {
          return scope.creating = true;
        };
        scope.save = function() {
          return DiscussionService.create(scope.discussion).then(function(discussion) {
            scope.discussions.push(discussion);
            return scope.creating = false;
          });
        };
        return scope.cancel = function() {
          return scope.creating = false;
        };
      },
      templateUrl: 'community/notifications/notificationsBlankState.html'
    };
  }
];
