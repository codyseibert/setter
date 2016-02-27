###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'RegisterGymController', [
  '$scope'
  '$location'
  'GymAccountRequestsService'
  'LoginService'
  ($scope, $location, GymAccountRequestsService, LoginService) ->
    'use strict'
    $scope.form = {}

    $scope.save = ->
      GymAccountRequestsService.createGymAccountRequest($scope.form.email, $scope.form.name, $scope.form.address).success (pData) ->
        undefined
      return

    return
]
