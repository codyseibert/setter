module.exports = [
  '$scope', function($scope) {
    $scope.labels = ['v0', 'v1', 'v2', 'v3', 'v4', 'v5', 'v8'];
    $scope.series = ['Grade'];
    $scope.data = [[2, 3, 4, 5, 2, 1, 1]];
    return $scope.piedata = [2, 3, 4, 5, 2, 1, 1];
  }
];
