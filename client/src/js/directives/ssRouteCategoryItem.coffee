angular.module('SETTER').directive 'ssRouteCategoryItem', [ ->
  {
    replace: true
    restrict: 'E'
    require: '^ssRouteCategorySelector'
    templateUrl: 'templates/directives/ssRouteCategoryItem.tpl.html'
    scope: category: '='
    link: (scope, element, attrs, ssRouteCategorySelector) ->

      scope.makeActive = ->
        ssRouteCategorySelector.setActiveCategory scope.category
        return

      scope.categoryActive = ->
        ssRouteCategorySelector.getActiveCategory() == scope.category

      return

  }
 ]
