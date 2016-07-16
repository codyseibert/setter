module.exports = [
  '$rootScope', '$state', '$stateParams', 'SetterService', 'User', function($rootScope, $state, $stateParams, SetterService, User) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        scope.creating = false;
        scope.form = {};
        SetterService.find({
          gymId: User.gymId
        }).then(function(setters) {
          scope.setters = setters;
          return scope.setters.forEach(function(setter) {
            return setter.image = 'assets/images/me.jpeg';
          });
        });
        scope.submit = function() {
          scope.creating = false;
          scope.form.gymId = User.gymId;
          return SetterService.create(scope.form).then(function(setter) {
            return scope.setters.push(setter);
          });
        };
        scope["new"] = function() {
          return scope.creating = !scope.creating;
        };
        return scope.cancel = function() {
          return scope.creating = false;
        };
      },
      templateUrl: 'components/setters/template.html'
    };
  }
];
