/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .directive('onRenderRefreshTooltip', [
        function () {
            'use strict';

            return {
                restrict: 'A',
                link: function () {
                    $(document).foundation('tooltip', 'reflow');
                }
            };
        }]);


