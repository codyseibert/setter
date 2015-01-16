/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .directive('onWidthChange', [
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

        var template = '<div ng-controller="BoulderRoutesGraphController">        <a  class="right"            ng-click="export()"            ng-show="getAccountId() === gymId">Export Graph        </a>        <h2 class="fwl clearfix">Current Boulder Routes</h2>        <canvas            id="boulderGraph"            class="chart-bar"            data="graph.data"            labels="graph.labels"            options="chartOptions"            legend="true"            width="100%"        </canvas>    </div>';

        return {
            restrict: 'A',
            link: function (scope, element, attr) {
                var templateUrl = attr.onVisible;
                scope.$watch(function() {
                        return element.width();
                    },
                    function (newValue, oldValue) {
                        console.log("name:", attr.onWidthChange, "new:", newValue, "old", oldValue);
                        //var el = angular.element(template);
                        //var compiled = $compile(el);
                        //compiled(scope);
                        //element.html(el);
                    }
                );
            }
        }
    }]);
