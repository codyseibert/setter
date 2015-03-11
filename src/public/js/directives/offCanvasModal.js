
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
             
            var modalType = attrs.type;
            element.addClass(modalType);
            scope.hideOffCanvasModal = function() {
                console.log('this ran for sure');
                scope.isShowing = false; 


            }; 
        },
        
    };
});


