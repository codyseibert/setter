module.exports = [
  '$scope', '$stateParams', 'DiscussionService', 'LoginService', 'lodash', function($scope, $stateParams, DiscussionService, LoginService, _) {
    var DISCUSSION, GEAR;
    DISCUSSION = 0;
    GEAR = 1;
    $scope.discussion = {};
    $scope.discussion.gymId = $stateParams.gymId;
    $scope.discussion.accountId = LoginService.user.id;
    $scope.discussion.type = DISCUSSION;
    $scope.gear = {};
    $scope.gear.gymId = $stateParams.gymId;
    $scope.gear.accountId = LoginService.user.id;
    $scope.gear.type = GEAR;
    $scope.deleteDiscussion = function(discussion) {
      var isYes;
      isYes = confirm('are you sure you want to delete this discussion post?');
      if (!isYes) {
        return;
      }
      return DiscussionService["delete"](discussion).then(function() {
        return $scope.discussions.splice($scope.discussions.indexOf(discussion), 1);
      });
    };
    $scope.deleteGear = function(gear) {
      var isYes;
      isYes = confirm('are you sure you want to delete this gear post?');
      if (!isYes) {
        return;
      }
      return DiscussionService["delete"](gear).then(function() {
        return $scope.gears.splice($scope.gears.indexOf(gear), 1);
      });
    };
    $scope.ownsDiscussion = function(discussion) {
      return LoginService.user.id === discussion.accountId;
    };
    $scope.updateDiscussion = function(discussion) {
      return DiscussionService.update(discussion).then(function() {
        return discussion.creating = false;
      });
    };
    $scope.updateGear = function(gear) {
      return DiscussionService.update(gear).then(function() {
        return gear.creating = false;
      });
    };
    $scope.saveDiscussion = function() {
      return DiscussionService.create($scope.discussion).then(function(discussion) {
        $scope.discussions.push(discussion);
        return $scope.creatingDiscussion = false;
      });
    };
    $scope.saveGear = function() {
      return DiscussionService.create($scope.gear).then(function(gear) {
        $scope.gears.push(gear);
        return $scope.creatingGear = false;
      });
    };
    return DiscussionService.find({
      gymId: $stateParams.gymId
    }).then(function(discussions) {
      $scope.discussions = _.filter(discussions, {
        type: DISCUSSION
      });
      return $scope.gears = _.filter(discussions, {
        type: GEAR
      });
    });
  }
];
