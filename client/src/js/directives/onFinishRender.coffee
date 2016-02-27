###global angular: false, btoa: false, console: false, Chart: false, moment: false ###

angular.module('SETTER').directive 'onFinishRender', [
  '$timeout'
  ($timeout) ->
    'use strict'
    {
      restrict: 'A'
      link: (scope) ->
        if scope.$last == true
          $timeout ->
            scope.$emit 'ngRepeatFinished'
            return
        return

    }
]
