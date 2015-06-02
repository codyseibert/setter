angular.module('SETTER')
    .directive('ssPlaceholder', [
        '$timeout',
        function (
          $timeout
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                noData: "="
              },
              templateUrl: 'templates/directives/ssPlaceholder.tpl.html',
              controller: function($scope) {
                $scope.noData = false; 

              },
              link: function(scope, element, attrs) {

                scope.title = attrs.title;
                scope.par = attrs.par;
                scope.noData = scope.noData;

              }

            };
        }]);
