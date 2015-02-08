/*global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false */

angular.module('SETTER')
    .directive('refreshFoundation', [
        function () {
            'use strict';

            return {
                restrict: 'A',
                link: function () {
                    $(document).foundation();
                }
            };
        }]);
