/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SelectedRouteService', [
        function (
        ) {
            'use strict';

            var selectedRoute = null;

            return {

                offCanvasModalShown: false,  

                setSelectedRoute: function (route) {
                        //Checking to see if a route is being received 
                        //Current no
                    console.log(route);
                    selectedRoute = route;
                },
                getSelectedRoute: function () {
                    return selectedRoute;
                },
                toggleModal: function() {
                    this.offCanvasModalShown = !this.offCanvasModalShown; 
                }, 
                hideModal : function() {
                    this.offCanvasModalShown = false;  
                }
            };
        }]);
