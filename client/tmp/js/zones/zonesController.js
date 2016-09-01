module.exports = [
  '$scope', '$state', '$stateParams', 'ZoneService', function($scope, $state, $stateParams, ZoneService) {
    $scope.form = {};
    $scope.form.gymId = $stateParams.gymId;
    ZoneService.find({
      gymId: $stateParams.gymId
    }).then(function(zones) {
      return $scope.zones = zones;
    });
    return $scope.submit = function() {
      return ZoneService.create($scope.form).then(function(zone) {
        return $scope.zones.push(zone);
      });
    };
  }
];
