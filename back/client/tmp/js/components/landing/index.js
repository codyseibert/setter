module.exports = [
  '$rootScope', '$state', 'GymService', function($rootScope, $state, GymService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        scope.gym = {};
        scope.user = {};
        return scope.registerGym = function() {
          return GymService.create(scope.gym).then(function(gym) {
            return $state.go('gyms.news', {
              gymId: gym.id
            });
          });
        };
      },
      templateUrl: 'components/landing/template.html'
    };
  }
];
