angular.module('SETTER').directive 'ssFeedbackButton', [
  '$rootScope'
  ($rootScope) ->
    'use strict'
    {
      restrict: 'E'
      replace: true
      templateUrl: 'templates/directives/ssFeedbackButton.tpl.html'
      link: (scope, element, attrs) ->

        scope.close = ->
          element.hide()
          return

        return

    }
]
