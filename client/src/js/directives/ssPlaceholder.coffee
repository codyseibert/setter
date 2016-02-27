angular.module('SETTER').directive 'ssPlaceholder', [
  '$timeout'
  '$rootScope'
  ($timeout, $rootScope) ->
    'use strict'
    {
      restrict: 'E'
      replace: true
      scope: noData: '='
      templateUrl: 'templates/directives/ssPlaceholder.tpl.html'
      link: (scope, element, attrs) ->
        scope.$watch 'noData', ->
          #Prevents the images and data from the placeholders to load
          #if they are hidden on init
          if scope.noData == 'true' or scope.noData == true
            if attrs.title == ''
              element.find('h2').hide()
            scope.title = attrs.title
            scope.paragraph = attrs.paragraph
            scope.placeholderSize = attrs.size
            scope.linkText = attrs.linkText
            scope.linkDestination = attrs.page
            scope.image = attrs.image
          return
        return

    }
]
