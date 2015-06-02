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
              scope: {
                noData : "@"
              },
              templateUrl: 'templates/directives/ssPlaceholder.tpl.html',
              link: function(scope, element, attrs) {

                scope.$watch('noData', function() {
                    //Prevents the images and data from the placeholders to load
                    //if they are hidden on init
                    if(scope.noData === "true" || scope.noData === true){
                        if(attrs.title === "") {
                            element.find('h2').hide();
                        }

                        scope.title = attrs.title;
                        scope.paragraph = attrs.paragraph;
                        scope.placeholderSize = attrs.size;
                        scope.linkText = attrs.linkText;
                        scope.linkDestination = attrs.page;
                        scope.image = attrs.image;
                    }
                    else {
                        return;
                    }

                });

              }

            };
    }]);
