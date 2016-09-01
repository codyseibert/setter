module.exports = [
  '$scope'
  (
    $scope
  ) ->

    $scope.labels = ['v0', 'v1', 'v2', 'v3', 'v4', 'v5', 'v8'];
    $scope.series = ['Grade'];

    $scope.data = [
      [2, 3, 4, 5, 2, 1, 1]
    ];

    $scope.piedata = [2, 3, 4, 5, 2, 1, 1]

    $scope.linelabels = ["January", "February", "March", "April", "May", "June", "July"];
    $scope.lineseries = ['Series A'];
    $scope.linedata = [
      [65, 59, 80, 81, 56, 55, 40]
    ];

]
