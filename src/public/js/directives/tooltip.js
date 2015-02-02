angular.module('SETTER')
    .directive('tooltip', function () {
        return {
            restrict: 'E',
            scope: {
            },
            replace: true,
            templateUrl: 'templates/Tooltip.tpl.html',
            controller: function ($scope) {

            },
            link: function (scope, element, attrs) {

            }
        };
    });
