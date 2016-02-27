/*global angular: false, btoa: false, console: false, Chart: false, moment: false */

angular.module('SETTER')
    .directive('injectTemplateWhenVisible', [
        '$compile',
        function (
            $compile
        ) {
            'use strict';

            var TEMPLATE = '<ng-include src="{0}" ng-controller="{1}"></ng-include>';

            return {
                restrict: 'A',
                scope: {
                    injectWhen: '=injectWhen'
                },
                link: function (scope, element, attr) {
                    // Load a internal template that consists of ng-include
                    var templateUrl = ' \'{0}\' '.format(attr.template),
                        controllerName = attr.controller,
                        template = TEMPLATE.format(templateUrl, controllerName),
                        loaded = false;

                    // Watch the element for visible change state
                    scope.$watch('injectWhen',
                        function (newValue) {
                            if (newValue === true && !loaded) {
                                var el = angular.element(template),
                                    compiled = $compile(el);
                                compiled(scope);
                                element.html(el);
                                loaded = true;
                            }
                        }
                    );
                }
            };
        }]);
