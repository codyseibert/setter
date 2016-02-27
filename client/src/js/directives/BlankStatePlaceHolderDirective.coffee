###global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false ###

###jslint nomen: true ###

###jslint unparam: true###

# 1. "@"   (  Text binding / one-way binding )
# 2. "="   ( Direct model binding / two-way binding )
# 3. "&"   ( Behaviour binding / Method binding  )
angular.module('SETTER').directive 'blankStatePlaceHolder', [ ->
  'use strict'
  {
    scope: 'model': '=blankStatePlaceHolder'
    restrict: 'A'
    replace: true
    templateUrl: 'templates/BlankStatePlaceHolder.tpl.html'
    link: (scope, element, attrs) ->

  }
 ]
