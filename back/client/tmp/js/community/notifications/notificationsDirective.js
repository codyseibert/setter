module.exports = [
  '$rootScope', '$q', '$stateParams', 'DiscussionService', 'LoginService', 'lodash', function($rootScope, $q, $stateParams, DiscussionService, LoginService, _) {
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
        scope.deleteDiscussion = function(discussion) {
          var isYes;
          isYes = confirm('are you sure you want to delete this discussion post?');
          if (!isYes) {
            return;
          }
          return DiscussionService["delete"](discussion).then(function() {
            return scope.discussions.splice(scope.discussions.indexOf(discussion), 1);
          });
        };
        scope.ownsDiscussion = function(discussion) {
          return LoginService.user.id === discussion.accountId;
        };
        scope.updateDiscussion = function(discussion) {
          return DiscussionService.update(discussion).then(function() {
            return discussion.creating = false;
          });
        };
        return scope.saveDiscussion = function() {
          return DiscussionService.create(scope.discussion).then(function(discussion) {
            scope.discussions.push(discussion);
            return scope.creatingDiscussion = false;
          });
        };
      },
      templateUrl: 'community/notifications/notifications.html'
    };
  }
];
