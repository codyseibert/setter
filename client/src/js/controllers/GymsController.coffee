###jslint nomen: true ###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'GymsController', [
  '$scope'
  'GymsService'
  'LoginService'
  ($scope, GymsService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.gyms = []
    $scope.form = search: ''
    GymsService.getGyms (pData) ->
      pData.map (pEntry) ->
        pEntry.show = true
        pEntry
      $scope.gyms = pData
      return

    $scope.applySearch = ->
      search = $scope.form.search
      search = search.toUpperCase()
      $scope.gyms.map (pEntry) ->
        if $scope.form.search == '' or pEntry.name.toUpperCase().indexOf(search) != -1 or pEntry.address.toUpperCase().indexOf(search) != -1
          pEntry.show = true
        else
          pEntry.show = false
        pEntry
      return

    return
]
