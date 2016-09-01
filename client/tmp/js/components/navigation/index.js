module.exports = [
  '$rootScope', '$stateParams', function($rootScope, $stateParams) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        return scope.$watch(function() {
          return $stateParams.gymId;
        }, function(newValue) {
          return scope.gymId = newValue;
        });
      },
      templateUrl: 'components/navigation/template.html'
    };
  }
];
