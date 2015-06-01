angular.module('SETTER')
    .directive('ssLineGraph', [
        '$timeout',
        function (
          $timeout
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                graphData: "=",
                type: "@"
              },
              templateUrl: 'templates/graphs/lineGraph.tpl.html',
              controller: function($scope) {

              },
              link: function(scope, element, attrs) {
                var options = {};
                options.height = "300px";
                options.axisY = {
                  labelInterpolationFnc: function(value) {
                    if (scope.type === 'bouldering') {
                      return 'V' + Math.round(value);
                    } else {
                      return '5.' + Math.round(value);
                    }
                  }
                }

                var render = function () {
                    $timeout(function() {
                        if (scope.graphData) {
                            new Chartist.Line(element.find('.ct-chart')[0], scope.graphData, options);
                            scope.hideSpinner = true;
                        }
                    });
                };

                scope.$watch('graphData', render);
              }

            };
        }]);
