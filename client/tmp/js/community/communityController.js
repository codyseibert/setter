module.exports = [
  '$scope', '$stateParams', 'DiscussionService', 'LoginService', 'lodash', function($scope, $stateParams, DiscussionService, LoginService, _) {
    var DISCUSSION, GEAR;
    DISCUSSION = 0;
    GEAR = 1;
    $scope.discussions = [];
    $scope.gears = [];
    return DiscussionService.find({
      gymId: $stateParams.gymId
    }).then(function(entries) {
      _.each(_.filter(entries, {
        type: DISCUSSION
      }), function(discussion) {
        return $scope.discussions.push(discussion);
      });
      return _.each(_.filter(_.filter(entries, {
        type: GEAR
      })), function(gear) {
        console.log(gear);
        return $scope.gears.push(gear);
      });
    });
  }
];
