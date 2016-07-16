module.exports = [
  '$rootScope', '$state', 'GymService', 'LoginService', 'jwtHelper', function($rootScope, $state, GymService, LoginService, jwtHelper) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        scope.gym = {};
        scope.user = {};
        return scope.registerGym = function() {
          return GymService.create(scope.gym).then(function(gym) {
            return LoginService.login(scope.gym.email, scope.gym.password);
          }).then(function() {
            return $state.go('gyms.news', {
              gymId: LoginService.user.id
            });
          });
        };
      },
      templateUrl: 'components/landing/template.html'
    };
  }
];
