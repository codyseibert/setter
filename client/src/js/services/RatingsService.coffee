###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'RatingsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getRatingForRoute: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/rating'
      updateRating: (pRouteId, pRating) ->
        $http
          method: 'POST'
          url: 'api/routes/' + pRouteId + '/rating'
          data: rating: pRating
      hasRated: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/hasRated'

    }
]
