
angular.module('SETTER')
    .directive('ssBackButton', [
        '$rootScope',
        function (
            $rootScope
        ) {
            'use strict';

            return {
                restrict: 'E',
                replace: true,
                templateUrl: 'templates/directives/ssBackButton.tpl.html',
                link: function (scope, element, attrs) {
                    scope.backButtonActive = false; 


                    $rootScope.$on('$routeChangeSuccess', function () {
                            console.log("HEY");
                        if($rootScope.currentPageIsZones() || $rootScope.currentPageIsZone() ||  $rootScope.currentPageIsUser() && $rootScope.isGymAccount()) {
                            
                            scope.backButtonActive = true;

                        }
                        else if($rootScope.currentPageIsGyms()) {
                            scope.backButtonActive = false; 
                        }
                        else {
                            scope.backButtonActive = false; 
                        }
                   });
                }
            };
        }]);
