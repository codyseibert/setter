angular.module('SETTER')
    .directive('ssLineGraph', [
        '$timeout',
        '$interval',
        function (
          $timeout,
          $interval
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
                $scope.noData = true;

                $scope.render = function () {

                    $timeout(function() {
                        $scope.createGraph();
                        $scope.loading = false;
                    });

                };

                $scope.$watch('graphData', function() {
                    $scope.loading = true;
                    //Prevents graph from loading even with zero values
                    if($scope.graphData === undefined) {
                        return;
                    }else if($scope.graphData.labels.length === 0 ) {
                        $scope.noData = true;
                        $scope.loading = false;
                    }
                    else {
                        $scope.loading = true;
                        $scope.noData = false;
                        $scope.render();
                    }
                });

              },
              link: function(scope, element, attrs) {
                scope.noData = true;

                var options = {};
                options.height = "300px";
                if (scope.type === 'bouldering') {
                  options.low = 0;
                  options.high = 10;
                } else {
                  options.low = 7;
                  options.high = 14;
                }
                options.axisY = {
                  labelInterpolationFnc: function(value) {
                    if (scope.type === 'bouldering') {
                      return 'V' + Math.round(value);
                    } else {
                      return '5.' + Math.round(value);
                    }
                  }
                }

                scope.createGraph = function () {
                    new Chartist.Line(element.find('.ct-chart')[0], scope.graphData, options);
                    $interval(function (){
                      if (element.find('.ct-chart')[0])
                        element.find('.ct-chart')[0].__chartist__.update();
                    }, 200);
                };

              }

            };
        }]);
