/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .directive('onFinishRender', [
        '$timeout',
        function (
            $timeout
        ) {
            'use strict';

            return {
                restrict: 'A',
                link: function (scope) {
                    if (scope.$last === true) {
                        $timeout(function () {
                            scope.$emit('ngRepeatFinished');
                        });
                    }
                }
            };
        }]);
