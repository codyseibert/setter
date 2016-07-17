module.exports = [
  '$scope', '$state', 'LoginService', function($scope, $state, LoginService) {
    return $scope.login = function() {
      return LoginService.login($scope.login.email, $scope.login.password).then(function() {
        return $state.go('gyms.news', {
          gymId: LoginService.user.id
        });
      });
    };
  }
];
