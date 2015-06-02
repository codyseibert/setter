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
                noData: "=",
                image: "@"
              },
              templateUrl: 'templates/directives/ssPlaceholder.tpl.html',
              controller: function($scope) {
              },
              link: function(scope, element, attrs) {
                scope.title = attrs.title;
                scope.paragraph = attrs.paragraph;
              }

            };
        }]);
