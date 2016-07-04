
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
              controller: ['$scope', function($scope) {

                  $scope.activeCategory = {};

                  this.setActiveCategory = function(pCategory) {
                      $scope.activeCategory = pCategory;

                         switch ($scope.activeCategory) {
                             case 'boulder':
                                $scope.activeCategoryText = "Bouldering";
                                 break;
                             case 'toprope':
                                $scope.activeCategoryText = "Top Rope";

                                 break;
                             case 'lead':
                                $scope.activeCategoryText = "Lead";

                                 break;
                             default:

                         }
                  };

                  this.getActiveCategory = function(pCategory) {
                      return $scope.activeCategory;
                  };

              }],
              link: function(scope, element, attrs, ctrl)  {
                  scope.categories = ['boulder', 'toprope', 'lead'];
                  ctrl.setActiveCategory(scope.categories[0]);
              }
          }

        }]);
