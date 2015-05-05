/*Rating Directive*/

angular.module('SETTER')
    .directive('starRating', function() {
        return {
            restrict: 'A',
            scope: {
                rating: '='
            },
            replace: true,
            // transclude: true,
            templateUrl: 'templates/StarRating.tpl.html',
            controller: 'StarRatingController',
            link: function(scope, element, attrs)  {
            }
        };
});
