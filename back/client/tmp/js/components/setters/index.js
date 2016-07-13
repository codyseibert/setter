module.exports = [
  '$rootScope', '$state', '$stateParams', 'SetterService', function($rootScope, $state, $stateParams, SetterService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        SetterService.find({
          gymId: $stateParams.gymId
        }).then(function(setters) {
          return scope.setters = setters;
        });
        return scope.submit = function() {
          scope.form.gymId = $stateParams.gymId;
          return SetterService.create(scope.form).then(function(setter) {
            return scope.setters.push(setter);
          });
        };
      },
      templateUrl: 'components/setters/template.html'
    };
  }
];
