/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('SelectedRouteService', [
        function (
        ) {
            'use strict';

            var selectedRoute = null;

            return {
                setSelectedRoute: function (route) {
                    selectedRoute = route;
                },
                getSelectedRoute: function () {
                    return selectedRoute;
                }
            };
        }]);
