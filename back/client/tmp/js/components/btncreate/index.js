module.exports = [
  '$rootScope', function($rootScope) {
    return {
      restrict: 'E',
      scope: {
        save: '=',
        creating: '='
      },
      link: function(scope, elem, attr) {
        scope.create = function() {
          return scope.creating = !scope.creating;
        };
        scope.cancel = function() {
          return scope.creating = false;
        };
        return scope.preSave = function() {
          scope.creating = false;
          return scope.save();
        };
      },
      templateUrl: 'components/btncreate/template.html'
    };
  }
];
