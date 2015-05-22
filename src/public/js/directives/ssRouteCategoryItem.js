
angular.module('SETTER')
    .directive('ssRouteCategoryItem', [
        function() {

        return {
            
            replace: true, 
            restrict: 'E',
            require: '^ssRouteCategorySelector',
            templateUrl: 'templates/directives/ssRouteCategoryItem.tpl.html',
            scope: {
                category: "="
            },
            link: function(scope, element, attrs, ssRouteCategorySelector)  {


                scope.makeActive = function() {
                    ssRouteCategorySelector.setActiveCategory(scope.category);
                };

                scope.categoryActive = function() {
                    return ssRouteCategorySelector.getActiveCategory() === scope.category;
                };


            }


        }


}]);
