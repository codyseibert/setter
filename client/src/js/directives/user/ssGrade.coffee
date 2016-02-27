angular.module('SETTER').directive 'ssGrade', [ ->
  'use strict'
  {
    restrict: 'E'
    replace: true
    scope:
      title: '@'
      grade: '@'
    templateUrl: 'templates/directives/ssGrade.tpl.html'
    controller: ->
    link: (scope, element, attrs) ->

  }
 ]
