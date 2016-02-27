###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'SendsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getSendsForRoute: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/sends'
      hasSent: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/hasSent'
      createSend: (pRouteId) ->
        $http
          method: 'POST'
          url: 'api/routes/' + pRouteId + '/sends'
      deleteSend: (pRouteId) ->
        $http
          method: 'DELETE'
          url: 'api/routes/' + pRouteId + '/sends'

    }
]
