/*Rating Directive*/

angular.module('SETTER')
    .directive('ssRouteSearch', function() {
        return {
            restrict: 'EA',
            replace: true,
            // transclude: true,
            templateUrl: 'templates/directives/ssRouteSearch.tpl.html',
            controller: 'ssRouteSearchController',
            controllerAS: 'ssRouteSearch',
            link: function(scope, element, attrs)  {

            }
        };
});
