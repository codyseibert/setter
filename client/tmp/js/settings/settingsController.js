module.exports = [
  '$scope', '$stateParams', 'GymService', 'FileService', function($scope, $stateParams, GymService, FileService) {
    GymService.get($stateParams.gymId).then(function(gym) {
      $scope.gym = gym;
      return $scope.gym.hideSetters = !!gym.hideSetters;
    });
    $scope.submit = function() {
      return GymService.update($scope.gym).then(function(gym) {});
    };
    return $scope.upload = function(file, key) {
      return FileService.upload(file).then(function(data) {
        return $scope.gym[key] = data;
      });
    };
  }
];
