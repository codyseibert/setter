module.exports = [
  '$rootScope', '$stateParams', 'GymService', function($rootScope, $stateParams, GymService) {
    return {
      restrict: 'E',
      scope: {
        model: '='
      },
      link: function(scope, elem, attr) {
        return GymService.get($stateParams.gymId).then(function(gym) {
          return scope.gym = gym;
        });
      },
      templateUrl: 'components/banner/template.html'
    };
  }
];
