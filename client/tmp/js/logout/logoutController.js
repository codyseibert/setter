module.exports = [
  '$scope', '$state', 'LoginService', function($scope, $state, LoginService) {
    LoginService.logout();
    return $state.go('landing');
  }
];
