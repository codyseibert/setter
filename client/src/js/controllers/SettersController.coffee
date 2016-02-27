###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false ###

angular.module('SETTER').controller 'SettersController', [
  '$scope'
  '$routeParams'
  'SettersService'
  'LoginService'
  ($scope, $routeParams, SettersService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.gymId = $routeParams.gymId

    createStars = ->
      stars = []
      i = undefined
      i = 0
      while i < 5
        stars.push rating: i + 1
        i += 1
      stars

    SettersService.getSettersAtGym(LoginService.getAccountId()).success (pData) ->
      pData.map (pEntry) ->
        pEntry.stars = createStars()
        pEntry
      $scope.setters = pData
      return

    $scope.removeSetterClicked = (pSetter) ->
      SettersService.removeSetterGymAccess($scope.gymId, pSetter.account_id).success ->
        doIt = confirm('Are you sure?  (Don\'t worry, they can easily be added back again)')
        if !doIt
          return
        index = $scope.setters.indexOf(pSetter)
        $scope.setters.splice index, 1
        alert pSetter.firstname + ' ' + pSetter.lastname + ' removed to your gym\'s setter list'
        return
      return

    $scope.isFilled = (pStar, pSetter) ->
      if pStar.rating <= pSetter.rating
        return true
      false

    return
]
