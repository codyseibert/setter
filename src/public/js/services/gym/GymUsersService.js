/*jslint nomen: true */
/*global angular: false, btoa: false, console: false, confirm: false, moment: false */

angular.module('SETTER')
    .factory('GymUsersService', ['$resource', function ($resource) {

        return $resource('api/gyms/:id/users/grades/bouldering', {id: '@id'}, {});

    }]);
