/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('RoutesService', ['$http', function ($http) {
        'use strict';

        return {
            getRoutesInGym: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/routes'
                });
            },
            getRoutesOnWall: function (pWallId) {
                return $http({
                    method: 'GET',
                    url: 'api/walls/' + pWallId + '/routes'
                });
            },
            getRoute: function (pRouteId) {
                return $http({
                    method: 'GET',
                    url: 'api/routes/' + pRouteId
                });
            },
            createRoute: function (pWallId, pName, pColorId, pBoulderGradeId, pRopeGradeId, pSetterId, pNote) {
                return $http({
                    method: 'POST',
                    url: 'api/walls/' + pWallId + '/routes',
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
            },
            stripRoute: function (pRouteId) {
                return $http({
                    method: 'POST',
                    url: 'api/routes/' + pRouteId + '/strip'
                });
            }
        };
    }]);
