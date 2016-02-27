###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false, alert: false ###

angular.module('SETTER').controller 'SuggestionsController', [
  '$scope'
  'SuggestionsService'
  'LoginService'
  ($scope, SuggestionsService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    sortSuggestions = undefined
    MAX_THUMB_SIZE = 60
    BASE_THUMB_SIZE = 16
    THUMB_GROW_COEF = 3
    SuggestionsService.getSuggestions().success (pData) ->
      $scope.suggestions = pData
      sortSuggestions()
      return

    sortSuggestions = ->
      $scope.suggestions.sort (a, b) ->
        b.upvotes - (a.upvotes)
      return

    $scope.postClicked = ->
      SuggestionsService.createSuggestion($scope.form.suggestion).success (pData) ->
        alert 'Thank you for your suggestion!'
        $scope.suggestions.push
          id: pData.id
          suggestion: $scope.form.suggestion
          upvotes: 0
        $scope.form.suggestion = ''
        return
      return

    $scope.upvote = (pSuggestion) ->
      SuggestionsService.upvoteSuggestion(pSuggestion.id).success (pData) ->
        alert 'Thank you for your upvote!'
        pSuggestion.disabled = true
        pSuggestion.upvotes += 1
        sortSuggestions()
        return
      return

    $scope.getFontSize = (pSuggestion) ->
      Math.min MAX_THUMB_SIZE, pSuggestion.upvotes * THUMB_GROW_COEF + BASE_THUMB_SIZE

    return
]
