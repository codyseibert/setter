module.exports = [
  '$scope', function($scope) {
    $scope.creating = false;
    $scope.entries = [
      {
        text: 'the gym will be close sunday',
        date: 'January 12th, 2016'
      }, {
        text: 'the gym will be close sunday',
        date: 'January 12th, 2016'
      }, {
        text: 'the gym will be close sunday',
        date: 'January 12th, 2016'
      }
    ];
    $scope.createNews = function() {
      return $scope.creating = !$scope.creating;
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
      return entry.editing = false;
    };
    return $scope["delete"] = function(entry) {
      var isYes;
      isYes = confirm('Are you sure you want to delete this news entry?');
      if (isYes) {
        return $scope.entries.splice($scope.entries.indexOf(entry), 1);
      }
    };
  }
];
