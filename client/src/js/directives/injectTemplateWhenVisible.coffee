###global angular: false, btoa: false, console: false, Chart: false, moment: false ###

angular.module('SETTER').directive 'injectTemplateWhenVisible', [
  '$compile'
  ($compile) ->
    'use strict'
    TEMPLATE = '<ng-include src="{0}" ng-controller="{1}"></ng-include>'
    {
      restrict: 'A'
      scope: injectWhen: '=injectWhen'
      link: (scope, element, attr) ->
        # Load a internal template that consists of ng-include
        templateUrl = ' \'{0}\' '.format(attr.template)
        controllerName = attr.controller
        template = TEMPLATE.format(templateUrl, controllerName)
        loaded = false
        # Watch the element for visible change state
        scope.$watch 'injectWhen', (newValue) ->
          if newValue == true and !loaded
            el = angular.element(template)
            compiled = $compile(el)
            compiled scope
            element.html el
            loaded = true
          return
        return

    }
]
