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
