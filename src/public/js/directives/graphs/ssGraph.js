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
                $scope.options = {
                    scaleFontColor: "#000",
                    scaleFontSize: 12,
                    animation: false
                };
              },
              link: function(scope, element, attrs) {
                scope.$watch('graphData', function (newValue, oldValue) {
                    if (newValue){
                      $timeout(function (){
                          var ctx = element[0].getContext('2d');
                          var chart = new Chart(ctx).Bar(scope.graphData, scope.options);
                      });
                    }
                }, true);
              }

            };
        }]);
