/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('GymUsersService',
        ['$resource', function($resource) {

        return {

            getBouldering : function() {
                return $resource('api/gyms/:gymId/users/grades/bouldering',
                        {id: "@gymId"},
                        {});
            },

            getTopRope : function() {
                return $resource('api/gyms/:gymId/users/grades/toprope',
                        {id: "@gymId"},
                        {});
            },

            getLead : function() {
                return $resource('api/gyms/:gymId/users/grades/lead',
                        {id: "@gymId"},
                        {})
            }
        }

    }]);
