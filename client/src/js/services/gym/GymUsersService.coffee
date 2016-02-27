###jslint nomen: true ###

###global angular: false, btoa: false, console: false, confirm: false, moment: false ###

angular.module('SETTER').factory 'GymUsersService', [
  '$resource'
  ($resource) ->
    { getUserGrades: (pType) ->
      $resource 'api/gyms/:gymId/users/grades/' + pType, { id: '@gymId' }, {}
 }
]
