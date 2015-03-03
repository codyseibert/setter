/*Rating Directive*/

angular.module('SETTER')
    .directive('starRating', function() {

        return {
            restrict: 'E',
            templateUrl: 'templates/StarRating.tpl.html',
            replace: true
        };

});