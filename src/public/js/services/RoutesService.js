/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('RoutesService', ['$http', function ($http) {
        'use strict';

        return {
            getRoutesInSet: function (pSetId) {
                return $http({
                    method: 'GET',
                    url: 'api/sets/' + pSetId + '/routes'
                });
            },
            getRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId
                });
            },
            createRoute: function (pSetId, pName, pColorId, pBoulderGradeId, pRopeGradeId, pSetterId, pNote) {
                return $http({
                    method: 'POST',
                    url: 'api/sets/' + pSetId + '/routes',
                    data: {
                        name: pName,
                        colorId: pColorId,
                        boulderGradeId: pBoulderGradeId,
                        ropeGradeId: pRopeGradeId,
                        setterId: pSetterId,
                        note: pNote
                    }
                });
            },
            updateRoute: function (pRouteId, pName, pColorId, pBoulderGradeId, pRopeGradeId, pSetterId, pNote) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId,
                    data: {
                        name: pName,
                        colorId: pColorId,
                        boulderGradeId: pBoulderGradeId,
                        ropeGradeId: pRopeGradeId,
                        setterId: pSetterId,
                        note: pNote
                    }
                });
            },
            deleteRoute: function (pRouteId) {
                return $http({
                    method: 'DELETE',
                    url: 'api/routes/' + pRouteId
                });
            }
        };
    }]);
