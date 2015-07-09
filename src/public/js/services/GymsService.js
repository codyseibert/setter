/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GymsService', [
        '$http',
        function (
            $http
        ) {
            'use strict';

            var gym = {},
                image = {},
                homeGymUsers = {},
                gyms = null;

            return {
                setGymImageAsDirty: function () {
                    image = {};
                },
                clearCache: function () {
                    gym = {};
                    image = {};
                    homeGymUsers = {};
                    gyms = null;
                },
                registerGym: function (pRegistrationInfo) {
                    return $http({
                        method: 'POST',
                        url: 'api/register/gym',
                        data: pRegistrationInfo
                    });
                },
                getGyms: function (pCallback) {
                    if (gyms) {
                        pCallback(gyms);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms'
                    }).success(function (pData) {
                        gyms = pData;
                        pCallback(gyms);
                    });
                },
                getGymImage: function (pGymId, pCallback) {
                    if (image[pGymId]) {
                        pCallback(image[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/image'
                    }).success(function (pData) {
                        image[pGymId] = pData;
                        pCallback(image[pGymId]);
                    });
                },
                getGymSettings: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/settings'
                    });
                },
                getGym: function (pGymId, pCallback) {
                    if (gym[pGymId]) {
                        pCallback(gym[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId
                    }).success(function (pData) {
                        gym[pGymId] = pData;
                        pCallback(gym[pGymId]);
                    });
                },
                getLatestProjects: function (pGymId, pCallback) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/projects'
                    });
                },
                getHomeGymUsers: function (pGymId, pCallback) {
                    if (homeGymUsers[pGymId]) {
                        pCallback(homeGymUsers[pGymId]);
                        return;
                    }

                    $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/users'
                    }).success(function (pData) {
                        homeGymUsers[pGymId] = pData;
                        pCallback(homeGymUsers[pGymId]);
                    });
                },
                getActivityStream: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/activity'
                    });
                },
                getNumberOfNewRoutes: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/new'
                    });
                },

                getAllCurrentRoutes: function(pGymId) {
                    return $http({
                        method: "GET",
                        url: 'api/gyms/' + pGymId + '/routes'
                    });
                },


                /*
                *   SECTION - Best Rated
                */
                getBestRatedBoulder: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder/best'
                    });
                },
                getBestRatedTopRope: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/toprope/best'
                    });
                },
                getBestRatedLead: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/lead/best'
                    });
                },




                /*
                *   SECTION - Newest Routes
                */
                getNewestBoulder: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder/new'
                    });
                },
                getNewestTopRope: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/toprope/new'
                    });
                },
                getNewestLead: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/lead/new'
                    });
                },

                getLatestComments: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/comments'
                    });
                }



                /*
                *   SECTION - Newest Routes
                */
                // getUserTopRopeGrade: function (pGymId) {
                //     return $http({
                //         method: 'GET',
                //         url: 'api/gyms/' + pGymId + '/users/grade/toprope/'
                //     });
                // },
                // getUserTopRopeGrade: function (pGymId) {
                //     return $http({
                //         method: 'GET',
                //         url: 'api/gyms/' + pGymId + '/users/grade/toprope/'
                //     });
                // },
                // getUserTopRopeGrade: function (pGymId) {
                //     return $http({
                //         method: 'GET',
                //         url: 'api/gyms/' + pGymId + '/users/grade/toprope/'
                //     });
                // }
            };
        }]);
