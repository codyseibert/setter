
angular.module('SETTER').controller 'AlertsController', [
  '$scope'
  '$routeParams'
  '$window'
  'AlertsService'
  'LoginService'
  ($scope, $routeParams, $window, AlertsService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.form = {}
    AlertsService.getAlertsForGym($scope.gymId).success (pData) ->
      $scope.alerts = pData
      return

    $scope.delete = (pAlert) ->
      confirm = $window.confirm('Are you sure you want to delete this alert?')
      if !confirm
        return
      AlertsService.deleteAlert($scope.gymId, pAlert.id).success ->
        $scope.alerts.splice $scope.alerts.indexOf(pAlert), 1
        return
      return

    $scope.postAlert = ->
      AlertsService.createAlert($scope.gymId, $scope.form.message).success (pData) ->
        alert =
          id: pData.id
          message: $scope.form.message
          date: moment()
        $scope.alerts.unshift alert
        $scope.form.message = ''
        return
      return

    return
]
