###global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false ###

angular.module('SETTER').directive 'onRenderRefreshTooltip', [ ->
  'use strict'
  {
    restrict: 'A'
    link: ->
      $(document).foundation 'tooltip', 'reflow'
      return

  }
 ]
