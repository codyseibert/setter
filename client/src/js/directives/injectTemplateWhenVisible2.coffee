###global angular: false, btoa: false, console: false, Chart: false, moment: false ###

angular.module('SETTER').directive 'injectTemplateWhenVisibled', [
  '$compile'
  '$timeout'
  ($compile, $timeout) ->
    'use strict'
    TEMPLATE = '<ng-include src="{0}" ng-controller="{1}"></ng-include>'
    {
      restrict: 'A'
      link: (scope, element, attr) ->
        # Load a internal template that consists of ng-include
        templateUrl = ' \'{0}\' '.format(attr.template)
        controllerName = attr.controller
        template = TEMPLATE.format(templateUrl, controllerName)
        # Watch the element for visible change state
        scope.$watch (->
          element.is ':visible'
        ), (newValue) ->
          if newValue == true
            el = angular.element(template)
            compiled = $compile(el)
            compiled scope
            element.html el
          return
        return

    }
]
