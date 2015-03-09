
angular.module('SETTER')
    .directive('offCanvasModal', function() {
    return {
        restrict: 'E', 
        scope: {
            ngShow: '='
        },
        replace: true,
        transclude: true, 
        templateUrl: 'templates/offCanvasModal.tpl.html',

        link: function(scope, element, attrs)  {
            scope.diaglogStyle = {}; 
            scope.hideOffCanvasModal = function() {
                scope.ngShow = false; 
            }; 
        },
        
    };
});


