module.exports = [
  '$rootScope', '$state', 'GymService', 'AccountService', 'LoginService', 'jwtHelper', function($rootScope, $state, GymService, AccountService, LoginService, jwtHelper) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        scope.gym = {};
        scope.user = {};
        scope.registerGym = function() {
          return GymService.create(scope.gym).then(function() {
            return LoginService.login(scope.gym.email, scope.gym.password);
          }).then(function() {
            return $state.go('gyms.news', {
              gymId: LoginService.user.id
            });
          });
        };
        return scope.registerUser = function() {
          return AccountService.create(scope.user).then(function() {
            return LoginService.login(scope.user.email, scope.user.password);
          }).then(function() {
            return $state.go('findgym');
          });
        };
      },
      templateUrl: 'components/landing/template.html'
    };
  }
];
