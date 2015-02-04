/*global angular: false, btoa: false, console: false, Chart: false, moment: false */


angular.module('SETTER')
    .directive('preventDefault', [
        function () {
            'use strict';

            var linkFn = function(scope, element, attrs) {
                $(element).on('click', function(event) {
                    event.preventDefault(); 
                });
            };

            return {
                restrict: 'A',
                link: linkFn
            };
        }]);
