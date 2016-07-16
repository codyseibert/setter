module.exports = [
  '$scope', '$stateParams', 'GymAlertService', function($scope, $stateParams, GymAlertService) {
    $scope.creating = false;
    $scope.alert = {};
    GymAlertService.find({
      gymId: $stateParams.gymId
    }).then(function(alerts) {
      return $scope.entries = alerts;
    });
    $scope.createNews = function() {
      $scope.creating = !$scope.creating;
      return GymAlertService.create({
        message: $scope.alert.message,
        gymId: $stateParams.gymId
      }).then(function(alert) {
        return $scope.entries.unshift(alert);
      });
    };
    $scope.cancel = function() {
      return $scope.creating = false;
    };
    $scope.edit = function(entry) {
      return entry.editing = true;
    };
    $scope.cancelEntry = function(entry) {
      return entry.editing = false;
    };
    $scope.save = function(entry) {
      return GymAlertService.update(entry).then(function() {
        return entry.editing = false;
      });
    };
    return $scope["delete"] = function(entry) {
      var isYes;
      isYes = confirm('Are you sure you want to delete this news entry?');
      return GymAlertService["delete"](entry).then(function() {
        if (isYes) {
          return $scope.entries.splice($scope.entries.indexOf(entry), 1);
        }
      });
    };
  }
];
