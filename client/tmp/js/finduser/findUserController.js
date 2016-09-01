module.exports = [
  '$scope', 'AccountService', function($scope, AccountService) {
    AccountService.find().then(function(users) {
      return $scope.users = users;
    });
    return $scope.myFilter = function(user) {
      if ($scope.search === '' || ($scope.search == null)) {
        return true;
      }
      return user.name.indexOf($scope.search) !== -1;
    };
  }
];
