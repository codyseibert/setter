/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('RoutesService', [
        '$http',
        function (
            $http
        ) {
            'use strict';

            var gymRoutes = {},
                routes = {},

                boulderRouteDistribution = {},
                topropeRouteDistribution = {},
                leadRouteDistribution = {},

                currentBoulderRoutes = {},
                currentTopRopeRoutes = {},
                currentLeadRoutes = {},

                allRoutes = {};

            return {

                clearCache: function () {
                    gymRoutes = {};
                    routes = {};
                    currentBoulderRoutes = {};
                    currentTopRopeRoutes = {};
                    currentLeadRoutes = {};
                },

                setGymRoutesDirty: function (pGymId) {
                    delete gymRoutes[pGymId];
                },

                setRoutesDirty: function (pGymId, pWallId) {
                    delete routes[pWallId];
                    delete currentBoulderRoutes[pGymId];
                    delete currentTopRopeRoutes[pGymId];
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
                    });
                },
                // loadAllGymRoutes: function (pGymId) {
                //     return $http({
                //         method: 'GET',
                //         url: 'api/gyms/' + pGymId + '/routes/all'
                //     }).success(function (pData) {
                //         for (var i = 0; i < pData.length; i++) {
                //             var route = pData[i];
                //             allRoutes[route.id] = route;
                //         };
                //         // allRoutes = pData;
                //
                //         setTimeout(function () {
                //             for (var key in allRoutes) {
                //                 allRoutes[key].boulder_grade = "omg";
                //             };
                //             console.log(allRoutes);
                //         }, 2000);
                //     });
                // },
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
                    });
                },
                getRoute: function (pRouteId) {
                    return $http({
                        method: 'GET',
                        url: 'api/routes/' + pRouteId
                    });
                },

                /*
                *   SECTION - Current Distribution Data by Type
                */
                getDistributions: function (pGymId, pType, pCallback) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/' + pType + '/dist'
                    });
                },

                /*
                *   SECTION - Current Routes by Type
                */
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

                getCurrentTopRopeRoutes: function (pGymId, pCallback) {
                    if (currentTopRopeRoutes[pGymId]) {
                        pCallback(currentTopRopeRoutes[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/toprope'
                    }).success(function (pData) {
                        currentTopRopeRoutes[pGymId] = pData;
                        pCallback(currentTopRopeRoutes[pGymId]);
                    });
                },

                getCurrentLeadRoutes: function (pGymId, pCallback) {
                    if (currentLeadRoutes[pGymId]) {
                        pCallback(currentLeadRoutes[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/lead'
                    }).success(function (pData) {
                        currentLeadRoutes[pGymId] = pData;
                        pCallback(currentLeadRoutes[pGymId]);
                    });
                },





                /*
                *   SECTION - Current Routes by Type
                */
                // Boulder
                getBoulderRouteDistribution: function (pGymId, pCallback) {
                    if (boulderRouteDistribution[pGymId]) {
                        pCallback(boulderRouteDistribution[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder/distribution'
                    }).success(function (pData) {
                        boulderRouteDistribution[pGymId] = pData;
                        pCallback(boulderRouteDistribution[pGymId]);
                    });
                },
                // Top Rope
                getTopRopeRouteDistribution: function (pGymId, pCallback) {
                    if (topropeRouteDistribution[pGymId]) {
                        pCallback(topropeRouteDistribution[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/toprope/distribution'
                    }).success(function (pData) {
                        topropeRouteDistribution[pGymId] = pData;
                        pCallback(topropeRouteDistribution[pGymId]);
                    });
                },
                // Lead
                getLeadRouteDistribution: function (pGymId, pCallback) {
                    if (leadRouteDistribution[pGymId]) {
                        pCallback(leadRouteDistribution[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/lead/distribution'
                    }).success(function (pData) {
                        leadRouteDistribution[pGymId] = pData;
                        pCallback(leadRouteDistribution[pGymId]);
                    });
                },




                /*
                *   SECTION - MISC
                */
                createRoute: function (
                    pGymId,
                    pWallId,
                    pName,
                    pColorId,
                    pType,
                    pBoulderGradeId,
                    pTopRopeGradeId,
                    pLeadGradeId,
                    pSetterId,
                    pNote
                ) {

                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'POST',
                        url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/routes',
                        data: {
                            name: pName,
                            colorId: pColorId,
                            type: pType,
                            boulderGradeId: pBoulderGradeId,
                            topRopeGradeId: pTopRopeGradeId,
                            leadGradeId: pLeadGradeId,
                            setterId: pSetterId,
                            note: pNote
                        }
                    });
                },

                updateRoute: function (
                    pGymId,
                    pWallId,
                    pRouteId,
                    pName,
                    pColorId,
                    pType,
                    pBoulderGradeId,
                    pTopRopeGradeId,
                    pLeadGradeId,
                    pSetterId,
                    pNote
                ) {

                    this.setGymRoutesDirty(pGymId);
                    this.setRoutesDirty(pGymId, pWallId);

                    return $http({
                        method: 'POST',
                        url: 'api/gyms/' + pGymId + '/routes/' + pRouteId,
                        data: {
                            name: pName,
                            colorId: pColorId,
                            type: pType,
                            boulderGradeId: pBoulderGradeId,
                            topRopeGradeId: pTopRopeGradeId,
                            leadGradeId: pLeadGradeId,
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
                },

                setRouteAsViewed: function (pRouteId) {
                    return $http({
                        method: 'DELETE',
                        url: 'api/routes/' + pRouteId + '/setAsViewed'
                    });
                }
            };
        }]);
