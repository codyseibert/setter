/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('GymUsersService', 
        ['$resource', function($resource) {

        return {

            getBouldering : function() {
                //GymUsersService.getBouldering().query(); to get all of bouldering
                return $resource('api/gyms/:gymId/routes/boulder', 
                        {id: "@gymId"},
                        {});
            },

            getTopRope : function() {

                return $resource('api/gyms/:gymId/routes/toprope', 
                        {id: "@gymId"},
                        {});
            },

            getLead : function() {
                return $resource('api/gyms/:gymId/routes/lead', 
                        {id: "@gymId"},
                        {})
            }
        } 

    }]);



