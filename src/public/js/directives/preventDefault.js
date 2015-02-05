/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */
/*jslint nomen: true */
/*jslint unparam: true*/

angular.module('SETTER')
    .directive('preventDefault', [
        function () {
            'use strict';

            return {
                restrict: 'A',
                link: function (scope, element, attrs) {
                    $(element).on('click', function (event) {
                        event.preventDefault();
                    });
                }
            };
        }]);
