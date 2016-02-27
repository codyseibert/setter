angular.module('SETTER').directive 'offCanvasModal', ->
  {
    restrict: 'E'
    scope:
      isShowing: '='
      type: '@'
    replace: true
    transclude: true
    templateUrl: 'templates/offCanvasModal.tpl.html'
    link: (scope, element, attrs) ->
      element.addClass scope.type

      scope.hideOffCanvasModal = ->
        scope.isShowing = false
        return

      return

  }
