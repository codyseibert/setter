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

              },
              link: function(scope, element, attrs) {

                var options = {};
                options.height = "300px";

                var render = function () {
                    $timeout(function() {
                        if (scope.graphData) {
                            new Chartist.Bar(element.find('.ct-chart')[0], scope.graphData, options);
                            scope.hideSpinner = true;
                        }
                    });
                };

                // scope.$watch(function () {
                //     // return $(element).is(":visible");
                // }, render);

                scope.$watch('graphData', render);
              }

            };
        }]);
