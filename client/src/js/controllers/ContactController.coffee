###jslint nomen: true ###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'ContactController', [
  '$scope'
  'FeedbackService'
  ($scope, FeedbackService) ->
    'use strict'

    $scope.send = ->
      FeedbackService.createFeedback($scope.form.name, $scope.form.message).success(->
        $scope.thanks = true
        return
      ).error ->
        $scope.error = true
        return
      return

    return
]
