###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'SetsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getSetsOnWall: (pWallId) ->
        $http
          method: 'GET'
          url: 'api/walls/' + pWallId + '/sets'
      getSet: (pSetId) ->
        $http
          method: 'GET'
          url: 'api/sets/' + pSetId
      createSet: (pGymId, pWallId) ->
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/sets'
      deleteSet: (pGymId, pSetId) ->
        $http
          method: 'DELETE'
          url: 'api/gyms/' + pGymId + '/sets/' + pSetId

    }
]
