/*global angular: false, btoa: false, console: false, Chart: false, moment: false */


angular.module('SETTER')
    .directive('preventDefault', [
        function () {
            'use strict';

            var linkFn = function(scope, element, attrs) {
                $(element).on('click', function(event) {
                    event.preventDefault(); 
                    console.log('working'); 
                });
            };

            return {
                restrict: 'A',
                link: linkFn
            };
        }]);

