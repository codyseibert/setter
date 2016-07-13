module.exports = [
  '$rootScope', '$state', 'GymService', function($rootScope, $state, GymService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        GymService.get(2).then(function(gym) {
          return scope.gym = gym;
        });
        return scope.submit = function() {
          return GymService.update(scope.gym).then(function(gym) {});
        };
      },
      templateUrl: 'components/settings/template.html'
    };
  }
];
