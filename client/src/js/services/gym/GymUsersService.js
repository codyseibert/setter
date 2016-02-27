/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('GymUsersService',
        ['$resource', function($resource) {

        return {

            getUserGrades : function(pType) {
                return $resource('api/gyms/:gymId/users/grades/' + pType,
                        {id: "@gymId"},
                        {});
            }
        }

    }]);
