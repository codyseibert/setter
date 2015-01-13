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
                getTopRatedBoulder: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder/top'
                    });
                },
                getTopRatedRope: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/rope/top'
                    });
                },
                getNewestBoulder: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/boulder/new'
                    });
                },
                getNewestRope: function (pGymId) {
                    return $http({
                        method: 'GET',
                        url: 'api/gyms/' + pGymId + '/routes/rope/new'
                    });
                }
            };
        }]);
