

angular.module('SETTER')
    .directive('ssRouteTypeIcon', [

        function() {

          return {
              scope: {
                'bouldering': '=',
                'toprope': '=',
                'lead' : '='
              },
              replace: true,
              restrict: 'E',
              templateUrl: 'templates/directives/ssRouteTypeIcon.tpl.html',
              bindToController: true,
              controller: ['$scope', function($scope) {
                
                if(this.bouldering) {
                    this.routeType = 'bouldering'; 
                } else if (this.toprope) {
                    this.routeType = 'toprope'; 

                } else if(this.lead) {
                    this.routeType = 'lead'; 
                }

              }],
              controllerAs: 'ssRouteType'

          }

        }]);
