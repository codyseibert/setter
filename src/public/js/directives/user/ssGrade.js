angular.module('SETTER')
    .directive('ssGrade', [
        function (
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {
                title: "@",
                grade: "@"
              },
              templateUrl: 'templates/directives/ssGrade.tpl.html',
              controller: function() {

              },
              link: function(scope, element, attrs) {

              }

            };
        }]);
