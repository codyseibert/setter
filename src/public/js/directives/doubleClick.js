/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .directive('clickAgain', [
        '$window',
        '$templateCache',
        '$compile',
        '$timeout',
        function (
            $window,
            $templateCache,
            $compile,
            $timeout
        ) {
            'use strict';

            return {
                restrict: 'A',
                link: function (scope, element, attr) {
                    scope.$watch(
                        function () {
                            console.log($(element).hasClass('active'));
                            return $(element).hasClass('active');
                        }, function () {
                            console.log("clicking again...");
                            element.click();
                        }
                    );
                }
            };
        }
    ]);
