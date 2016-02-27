angular.module('SETTER').directive 'ssUploadImage', [ ->
  'use strict'
  {
    restrict: 'E'
    replace: true
    scope:
      class: '@'
      clickableClass: '@'
      action: '@'
      authorization: '@'
      image: '@'
      callback: '='
      active: '='
    templateUrl: 'templates/directives/ssUploadImage.tpl.html'
    link: (scope, element, attrs) ->
      if scope.class == undefined
        scope.class = 'avatar--big'
      if scope.clickableClass == undefined
        scope.class = 'avatar avatar--big'
      if !scope.image or !scope.image or scope.image == ''
        scope.image = 'images/no_image.png'
      scope.isUploadingImage = false

      scope.fileNameChanged = ->
        scope.isUploadingImage = true
        element.find('.submit').trigger 'click'
        return

      scope.imageUploadComplete = (content) ->
        scope.isUploadingImage = false
        scope.image = content.url
        scope.callback content
        return

      return

  }
 ]
