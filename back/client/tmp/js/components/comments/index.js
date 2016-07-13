module.exports = [
  '$rootScope', function($rootScope) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {},
      templateUrl: 'components/comments/template.html'
    };
  }
];
