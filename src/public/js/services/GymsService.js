/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('GymsService', ['$http', function ($http) {
        'use strict';

        var gym = {};
        var image = {};
        var currentBoulderRoutes = {};
        var currentRopeRoutes = {};
        var homeGymUsers = {};
        var gyms = null;

        return {
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
            getActivityStream: function (pGymId) {
                return $http({
                    method: 'GET',
                    url: 'api/gyms/' + pGymId + '/activity'
                });
            }
        };
    }]);
