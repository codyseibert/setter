/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */

angular.module('SETTER')
    .directive('ssRouteListPlaceHolder', [
        function () {
            'use strict';

            return {
                scope: {
                  activeCategory: "=",
                  category: "@",
                  user: '='
                },
                templateUrl: 'templates/directives/ssRouteListPlaceHolder.tpl.html',
                replace: true,
                restrict: 'E',
                link: function(scope, element, attrs)  {

                  // user.title = Oops! These aren't the best routes at your gym.
                  // user.text = Climbers at your gym haven't rated any yet. Let them know you are on Setter and start getting feedback!
                  // link_text = null
                  // image: "images/placeholder--bestLead.jpg",
                  // click = navigateToGymSuggestions
                  //
                  //     images/placeholder--bestLead.jpg",
                  //         click: navigateToGymZones

                  scope.$watch('activeCategory', function (newValue, oldValue) {
                    scope.image = 'images/placeholder--' + scope.category + newValue.replace(' ', '') +'.jpg'
                  });

                }
            };
        }]);
