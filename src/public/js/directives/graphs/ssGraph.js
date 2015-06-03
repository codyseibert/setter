angular.module('SETTER')
    .directive('ssGraph', [
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
              templateUrl: 'templates/graphs/barGraph.tpl.html',
              controller: ['$scope', function($scope) {
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


              }],
              link: function(scope, element, attrs) {
                scope.noData = true;
                var options = {};
                options.height = "300px";
                options.axisY = {
                  labelInterpolationFnc: function(value) {
                    return Math.round(value);
                  }
                }


                scope.createGraph = function() {
                    new Chartist.Bar(element.find('.ct-chart')[0], scope.graphData, options);
                    $interval(function (){
                      if (element.find('.ct-chart')[0])
                        element.find('.ct-chart')[0].__chartist__.update();
                    }, 200);
                };
              }

            };
        }]);
