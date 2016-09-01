module.exports = [
  '$rootScope', function($rootScope) {
    return {
      restrict: 'E',
      scope: {
        save: '&',
        "delete": '&',
        editing: '='
      },
      link: function(scope, elem, attr) {
        scope.edit = function() {
          return scope.editing = !scope.editing;
        };
        scope.cancel = function() {
          return scope.editing = false;
        };
        return scope.preSave = function() {
          scope.editing = false;
          return scope.save();
        };
      },
      templateUrl: 'components/btnedit/template.html'
    };
  }
];
