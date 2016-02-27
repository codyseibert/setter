###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'GymSuggestionsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getSuggestionsForGym: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/suggestions'
      createSuggestion: (pGymId, pMessage) ->
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/suggestions'
          data: message: pMessage
      markAsRead: (pGymId, pSuggestionId) ->
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/suggestions/' + pSuggestionId + '/read'

    }
]
