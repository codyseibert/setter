module.exports = [
  '$rootScope', '$stateParams', function($rootScope, $stateParams) {
    return {
      restrict: 'E',
      scope: {
        model: '='
      },
      link: function(scope, elem, attr) {
        return scope.$watch(function() {
          return $stateParams.gymId;
        }, function(newValue) {
          return scope.gymId = newValue;
        });
      },
      templateUrl: 'components/header/template.html'
    };
  }
];
