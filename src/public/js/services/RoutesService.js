/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('RoutesService', [
        '$http',
        function (
            $http
        ) {
            'use strict';

            var gymRoutes = {};
            var routes = {};
            var currentBoulderRoutes = {};
            var currentRopeRoutes = {};

            return {

                setGymRoutesDirty: function (pGymId) {
                    delete gymRoutes[pGymId];
                },

                setRoutesDirty: function (pGymId, pWallId) {
                    delete routes[pWallId];
                    delete currentBoulderRoutes[pGymId];
                    delete currentRopeRoutes[pGymId];
                },

                getRoutesInGym: function (pGymId, pCallback) {
                    if (gymRoutes[pGymId]) {
                        pCallback(gymRoutes[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes'
                    }).success(function (pData) {
                        gymRoutes[pGymId] = pData;
                        pCallback(gymRoutes[pGymId]);
                    })
                },
                getRoutesOnWall: function (pWallId, pCallback) {
                    if (routes[pWallId]) {
                        pCallback(routes[pWallId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/walls/' + pWallId + '/routes'
                    }).success(function (pData) {
                        routes[pWallId] = pData;
                        pCallback(routes[pWallId]);
                    })
                },
                getRoute: function (pRouteId) {
                    return $http({
                        method: 'GET',
                        url: 'api/routes/' + pRouteId
                    });
                },

                getCurrentBoulderRoutes: function (pGymId, pCallback) {
                    if (currentBoulderRoutes[pGymId]) {
                        pCallback(currentBoulderRoutes[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder'
                    }).success(function (pData) {
                        currentBoulderRoutes[pGymId] = pData;
                        pCallback(currentBoulderRoutes[pGymId]);
                    });
                },

                getCurrentRopeRoutes: function (pGymId, pCallback) {
                    if (currentRopeRoutes[pGymId]) {
                        pCallback(currentRopeRoutes[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/rope'
                    }).success(function (pData) {
                        currentRopeRoutes[pGymId] = pData;
                        pCallback(currentRopeRoutes[pGymId]);
                    });
                },

                createRoute: function (pGymId, pWallId, pName, pColorId, pBoulderGradeId, pRopeGradeId, pSetterId, pNote) {
                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'POST',
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/routes',
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
                updateRoute: function (pGymId, pWallId, pRouteId, pName, pColorId, pBoulderGradeId, pRopeGradeId, pSetterId, pNote) {
                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'POST',
                        url: 'api/gyms/' + pGymId + '/routes/' + pRouteId,
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
                deleteRoute: function (pGymId, pWallId, pRouteId) {
                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'DELETE',
                        url: 'api/gyms/' + pGymId + '/routes/' + pRouteId
                    });
                },
                stripRoute: function (pGymId, pWallId, pRouteId) {
                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'POST',
                        url: 'api/gyms/' + pGymId + '/routes/' + pRouteId + '/strip'
                    });
                }
            };
        }]);
