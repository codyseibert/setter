/*Rating Directive*/

angular.module('SETTER')
    .directive('ssRouteSearch', function() {
        return {
            restrict: 'A',
            scope: {},
            replace: true,
            // transclude: true,
            templateUrl: 'templates/directives/ssRouteSearch.tpl.html',
            controller: 'ssRouteSearch',
            controllerAS: 'ssRouteSearch',
            link: function(scope, element, attrs)  {


            }
        };
});
