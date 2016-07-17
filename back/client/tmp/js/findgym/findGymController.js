module.exports = [
  '$scope', 'GymService', function($scope, GymService) {
    GymService.find().then(function(gyms) {
      return $scope.gyms = gyms;
    });
    return $scope.myFilter = function(gym) {
      if ($scope.search === '' || ($scope.search == null)) {
        return true;
      }
      return gym.name.indexOf($scope.search) !== -1;
    };
  }
];
