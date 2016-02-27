###jslint nomen: true ###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'PasswordResetController', [
  '$scope'
  '$window'
  'AccountsService'
  ($scope, $window, AccountsService) ->
    'use strict'

    $scope.back = ->
      $window.history.back()
      return

    $scope.resetPassword = ->
      email = $scope.form.email
      AccountsService.resetPassword(email).success ->
        $scope.success = true
        $scope.email = ''
        return
      return

    return
]
