
angular.module('SETTER')
    .directive('offCanvasModal', function() {
    return {
        restrict: 'E',
        scope: {
            isShowing: '=',
            type: '@'
        },
        replace: true,
        transclude: true,
        templateUrl: 'templates/offCanvasModal.tpl.html',

        link: function(scope, element, attrs)  {

            element.addClass(scope.type);

            scope.hideOffCanvasModal = function() {
                scope.isShowing = false; 
            };
        },

    };
});
