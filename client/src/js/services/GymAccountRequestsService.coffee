###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'GymAccountRequestsService', [
  '$http'
  ($http) ->
    'use strict'
    { createGymAccountRequest: (pEmail, pName, pAddress) ->
      $http
        method: 'POST'
        url: 'api/requests'
        data:
          email: pEmail
          name: pName
          address: pAddress
 }
]
