/*jslint nomen: true */
/*global angular: false */

angular.module('SETTER')
    .factory('UsersService', ['$http', function ($http) {
        'use strict';

        return {
            registerUser: function (pRegistrationInfo) {
                return $http({
                    method: "POST",
                    url: "api/register/user",
                    data: pRegistrationInfo
                });
            },
            getUser: function (pUserId) {
                return $http({
                    method: "GET",
                    url: "api/users/" + pUserId
                });
            },
            getUserImage: function (pUserId) {
                return $http({
                    method: "GET",
                    url: "api/users/" + pUserId + "/image"
                });
            },
            getBoulderSends: function (pUserId) {
                return $http({
                    method: "GET",
                    url: "api/users/" + pUserId + "/sends/boulder"
                });
            },
            getRopeSends: function (pUserId) {
                return $http({
                    method: "GET",
                    url: "api/users/" + pUserId + "/sends/rope"
                });
            },
            setHomeGym: function (pGymId) {
                return $http({
                    method: "POST",
                    url: "api/users/homegym/set",
                    data: {
                        gymId: pGymId
                    }
                });
            }
        };
    }]);