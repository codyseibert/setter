###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'SuggestionsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getSuggestions: ->
        $http
          method: 'GET'
          url: 'api/suggestions'
      createSuggestion: (pSuggestion) ->
        $http
          method: 'POST'
          url: 'api/suggestions'
          data: suggestion: pSuggestion
      upvoteSuggestion: (pSuggestionId) ->
        $http
          method: 'POST'
          url: 'api/suggestions/' + pSuggestionId + '/upvote'

    }
]
