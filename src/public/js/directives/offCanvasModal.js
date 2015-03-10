
angular.module('SETTER')
    .directive('offCanvasModal', function() {
    return {
        restrict: 'E', 
        scope: {
            isShowing: '='
        },
        replace: true,
        transclude: true, 
        templateUrl: 'templates/offCanvasModal.tpl.html',

        link: function(scope, element, attrs)  {
            
            scope.hideOffCanvasModal = function() {
                console.log('this ran for sure');
                scope.isShowing = false; 


            }; 
        },
        
    };
});


