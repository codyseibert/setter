###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false ###

angular.module('SETTER').controller 'GymSuggestionsController', [
  '$scope'
  '$routeParams'
  'GymSuggestionsService'
  'GymsService'
  'DateFormatService'
  'LoginService'
  ($scope, $routeParams, GymSuggestionsService, GymsService, DateFormatService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.form = {}
    GymsService.getGym $scope.gymId, (pData) ->
      $scope.gym = pData
      return
    if $scope.getAccountId() == $scope.gymId
      GymSuggestionsService.getSuggestionsForGym($scope.gymId).success (pData) ->
        pData.map (pEntry) ->
          pEntry.date = DateFormatService.format(pEntry.date)
          pEntry
        $scope.suggestions = pData
        return

    $scope.read = (pSuggestion) ->
      GymSuggestionsService.markAsRead($scope.gymId, pSuggestion.id).success ->
        pSuggestion.read = true
        return
      return

    $scope.postSuggestion = ->
      GymSuggestionsService.createSuggestion($scope.gymId, $scope.form.message).success ->
        alert 'Thank you for your suggestion!'
        $scope.navigateToGym $scope.gymId
        return
      return

    return
]
