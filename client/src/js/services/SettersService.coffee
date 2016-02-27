###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'SettersService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getSettersAtGym: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/setters'
      getUsers: ->
        $http
          method: 'GET'
          url: 'api/setters'
      createSetterGymAccess: (pGymId, pSetterId) ->
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/setters/access'
          data: setterId: pSetterId
      removeSetterGymAccess: (pGymId, pSetterId) ->
        $http
          method: 'DELETE'
          url: 'api/gyms/' + pGymId + '/setters/' + pSetterId + '/access'

    }
]
