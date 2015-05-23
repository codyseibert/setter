

angular.module('SETTER')
    .directive('ssRouteCategorySelector', [

        function() {

          return {
              scope: {
                'activeCategory': '='
              },
              replace: true,
              restrict: 'E',
              templateUrl: 'templates/directives/ssRouteCategorySelector.tpl.html',
              controller: function($scope) {

                  $scope.activeCategory = {};

                  this.setActiveCategory = function(pCategory) {
                      $scope.activeCategory = pCategory;
                  };

                  this.getActiveCategory = function(pCategory) {
                      return $scope.activeCategory;
                  };

              },
              link: function(scope, element, attrs, ctrl)  {
                  scope.categories = ['Bouldering', 'Top Rope', 'Lead'];
                  ctrl.setActiveCategory(scope.categories[0]);
              }
          }
          
        }]);
