angular.module('SETTER')
    .directive('ssGraph', [
        '$timeout',
        function (
          $timeout
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                graphData: "="
              },
              templateUrl: 'templates/graphs/barGraph.tpl.html',
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

                    if($scope.graphData.labels.length === 0 ) {

                        $scope.noData = true; 
                        $scope.loading = false;
                        console.log("no data");
                    }
                    else {
                        $scope.noData = false; 
                        $scope.render(); 
                    }

                });


              },
              link: function(scope, element, attrs) {

                scope.noData = true;
                var options = {};
                options.height = "300px";
       


                scope.createGraph = function() {
                    scope.hiddeSpinner = true; 
                    new Chartist.Bar(element.find('.ct-chart')[0], scope.graphData, options);
                };
              }

            };
        }]);
