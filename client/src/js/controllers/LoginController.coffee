###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'LoginController', [
  '$scope'
  '$location'
  '$cookies'
  'LoginService'
  'localStorageService'
  ($scope, $location, $cookies, LoginService, localStorageService) ->
    'use strict'
    if LoginService.isLoggedIn()
      LoginService.navigateToCorrectHomePage()
      return
    $scope.form = {}
    $scope.form.email = $cookies.email or ''

    $scope.login = ->
      LoginService.login($scope.form).success((pData) ->
        $cookies.email = $scope.form.email
        LoginService.setHeader pData.token
        LoginService.setAccountType pData.accountType
        LoginService.setAccountId pData.accountId
        LoginService.setHomeGymId pData.homeGymId
        LoginService.setImageUrl pData.url
        LoginService.setName pData.fullname
        LoginService.setGymName pData.gymName
        LoginService.setAccessList pData.gyms
        LoginService.navigateToCorrectHomePage()
        localStorageService.set 'cookies', $cookies
        LoginService.init()
        return
      ).error ->
        $scope.error = 'Yikes! Email or password entered are incorrect.'
        return
      return

    $scope.down = (pEvent) ->
      code = pEvent.keyCode or pEvent.which
      if code == 13
        $scope.login()
      return

    return
]
