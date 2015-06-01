
angular.module('SETTER')
    .directive('ssBackButton', [
        '$rootScope',
        '$routeParams',
        function (
            $rootScope,
            $routeParams
        ) {
            'use strict';

            return {
                restrict: 'E',
                replace: true,
                templateUrl: 'templates/directives/ssBackButton.tpl.html',
                link: function (scope, element, attrs) {
                    scope.backButtonActive = false; 

                    scope.applyIsShowing = function() {
                        element.removeClass('is-hidden');
                        element.addClass('is-showing');
                        element.siblings('.nav-menuIcon').removeClass('is-showing');
                        element.siblings('.nav-menuIcon').addClass('is-hidden');
                    };

                    scope.applyIsHidden = function() {
                        element.removeClass('is-showing');
                        element.addClass('is-hidden');
                         element.siblings('.nav-menuIcon').addClass('is-showing');
                        element.siblings('.nav-menuIcon').removeClass('is-hidden');
                    };

                    $rootScope.$on('$routeChangeSuccess', function () {
                        //This checks for all types of pages to the deliver the back button or not
                        if($rootScope.currentPageIsZones() || 
                           $rootScope.currentPageIsZone() ||  
                            $rootScope.currentPageIsUser() && $rootScope.isGymAccount()
                            || $rootScope.isUserAccount && $rootScope.currentPageIsUser() && $rootScope.currentPageIsOtherUser($routeParams.userId)) {
        
                            scope.backButtonActive = true;
                            scope.applyIsShowing(); 

                        }
                        else if($rootScope.currentPageIsGyms()) {
                            scope.backButtonActive = false; 
                            scope.applyIsHidden(); 
                        }
                        else {
                            scope.backButtonActive = false; 
                            scope.applyIsHidden(); 
                        }
                   });
                }
            };
        }]);
