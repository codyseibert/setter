angular.module('SETTER')
    .directive('stIsVisible', function () {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                scope.$watch(function() {
                    return element.is(':visible');
                }, function() {
                    console.log("HI");
                    scope.refreshCharts();
                });
            }
        };
    });
