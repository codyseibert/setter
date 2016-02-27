
angular.module('SETTER').controller 'AddSetterController', [
  '$scope'
  '$routeParams'
  'SettersService'
  'LoginService'
  ($scope, $routeParams, SettersService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.form = filter: ''
    $scope.gymId = $routeParams.gymId
    SettersService.getUsers().success (pData) ->
      pData.map (pEntry) ->
        pEntry.name = pEntry.firstname + ' ' + pEntry.lastname
        pEntry
      $scope.users = pData
      return

    $scope.addSetterClicked = (pSetter) ->
      SettersService.createSetterGymAccess($scope.gymId, pSetter.account_id).success ->
        index = $scope.users.indexOf(pSetter)
        $scope.users.splice index, 1
        alert pSetter.firstname + ' ' + pSetter.lastname + ' added to your gym\'s setter list'
        return
      return

    $scope.applyFilter = ->
      filter = $scope.form.filter.toUpperCase()
      $scope.users.map (pEntry) ->
        if pEntry.name.toUpperCase().indexOf(filter) != -1
          pEntry.hide = false
        else
          pEntry.hide = true
        pEntry
      return

    return
]
