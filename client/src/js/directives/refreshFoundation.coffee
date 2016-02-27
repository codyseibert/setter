###global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false ###

angular.module('SETTER').directive 'refreshFoundation', [ ->
  'use strict'
  {
    restrict: 'A'
    link: ->
      $(document).foundation()
      return

  }
 ]
