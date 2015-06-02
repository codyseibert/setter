angular.module('SETTER')
    .directive('ssPlaceholder', [
        '$timeout',
        '$rootScope',
        function (
          $timeout,
          $rootScope
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              scope: {},
              templateUrl: 'templates/directives/ssPlaceholder.tpl.html',
              controller: function($scope) {
              },
              link: function(scope, element, attrs) {
                scope.title = attrs.title;
                scope.paragraph = attrs.paragraph;
                scope.placeholderSize = attrs.size; 
                scope.linkText = attrs.linkText; 
                scope.linkDestination = attrs.page; 
                scope.image = attrs.image; 
              }

            };
        }]);
