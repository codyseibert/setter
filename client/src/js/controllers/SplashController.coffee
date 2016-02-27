###jslint nomen: true ###

###global angular: false, btoa: false, console: false, confirm: false, moment: false, alert: false ###

angular.module('SETTER').controller 'SplashController', [
  '$scope'
  'UsersService'
  'GymsService'
  'LoginService'
  'GymAccountRequestsService'
  ($scope, UsersService, GymsService, LoginService, GymAccountRequestsService) ->
    'use strict'
    if LoginService.isLoggedIn()
      LoginService.navigateToCorrectHomePage()
      return
    $scope.form = {}
    $scope.requestForm = {}
    $scope.GYM_REGISTRATION = 'gymRegistration'
    $scope.USER_REGISTRATION = 'userRegistration'
    $scope.currentRegistrationTab = $scope.GYM_REGISTRATION
    $scope.panel = $scope.GYM_REGISTRATION
    GymsService.getGyms (pData) ->
      $scope.form.gym = pData[0]
      $scope.gyms = pData
      return

    $scope.setCurrentTab = (pCurrentTab) ->
      $scope.currentRegistrationTab = pCurrentTab
      return

    $scope.saveAccountRequest = ->
      GymAccountRequestsService.createGymAccountRequest($scope.requestForm.email, $scope.requestForm.name, $scope.requestForm.address).success ->
        $scope.requestForm.email = ''
        $scope.requestForm.name = ''
        $scope.requestForm.address = ''
        alert 'Thank you for requesting an account!  We will get back to you soon with your account information!'
        undefined
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
