module.exports = [
  '$rootScope', function($rootScope) {
    return {
      restrict: 'E',
      scope: {
        model: '='
      },
      link: function(scope, elem, attr) {},
      templateUrl: 'components/banner/template.html'
    };
  }
];
