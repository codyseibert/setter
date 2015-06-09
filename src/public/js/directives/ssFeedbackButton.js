angular.module('SETTER')
    .directive('ssFeedbackButton', [
        '$rootScope', 
        function (
            $rootScope
        ) {
            'use strict';

            return {

              restrict: 'E',
              replace: true,
              templateUrl: 'templates/directives/ssFeedbackButton.tpl.html',
              link: function(scope, element, attrs) {

               scope.close = function() {
                    element.hide(); 
               }

              }

            };
    }]);
