###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'RegisterUserController', [
  '$scope'
  '$location'
  'UsersService'
  'GymsService'
  'LoginService'
  ($scope, $location, UsersService, GymsService, LoginService) ->
    'use strict'
    $scope.form = {}
    GymsService.getGyms (pData) ->
      $scope.form.gym = pData[0]
      $scope.gyms = pData
      return

    $scope.registerClicked = ->
      $scope.form.gym_id = $scope.form.gym.account_id
      UsersService.registerUser($scope.form).success((pData) ->
        LoginService.setHeader pData.token
        LoginService.setAccountType pData.accountType
        LoginService.setAccountId pData.accountId
        LoginService.setHomeGymId $scope.form.gym_id
        LoginService.setImageUrl null
        LoginService.setName $scope.form.firstname + ' ' + $scope.form.lastname
        $scope.navigateToGym $scope.form.gym_id
        return
      ).error (pData) ->
        $scope.error = pData.error
        if $scope.error == 'default error'
          $scope.error = 'Email address already in use'
        return
      return

    return
]
