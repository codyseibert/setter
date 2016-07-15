module.exports = [
  '$scope', function($scope) {
    $scope.users = [
      {
        name: 'Cody Seibert',
        image: 'assets/images/aiguille.gif'
      }, {
        name: 'Cody Seibert',
        image: 'assets/images/aiguille.gif'
      }, {
        name: 'Cody Seibert',
        image: 'assets/images/aiguille.gif'
      }
    ];
    return $scope.myFilter = function(user) {
      if ($scope.search === '' || ($scope.search == null)) {
        return true;
      }
      return user.name.indexOf($scope.search) !== -1;
    };
  }
];
