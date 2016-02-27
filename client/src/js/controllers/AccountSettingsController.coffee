angular.module('SETTER').controller 'AccountSettingsController', [
  '$scope'
  'AccountsService'
  ($scope, AccountsService) ->
    'use strict'
    $scope.settings = hide_setters: true
    AccountsService.getSettings().success (pData) ->
      $scope.settings.facebook = pData.facebook
      $scope.settings.hide_setters = pData.hide_setters == 1
      return

    $scope.updateSettings = ->
      AccountsService.updateSettings($scope.settings).success (pData) ->
        alert 'Your settings were succesfully updated.'
        return
      return

    $scope.changePassword = ->
      if $scope.form.password != $scope.form.repeat
        $scope.error = 'Passwords did not match!'
        $scope.form.password = ''
        $scope.form.repeat = ''
        return
      AccountsService.changePassword($scope.form.password).success ->
        $scope.form.password = ''
        $scope.form.repeat = ''
        return
      return

    return
]
