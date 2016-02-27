angular.module('SETTER').directive 'ssRouteTypeIcon', [ ->
  {
    scope:
      'bouldering': '='
      'toprope': '='
      'lead': '='
    replace: true
    restrict: 'E'
    templateUrl: 'templates/directives/ssRouteTypeIcon.tpl.html'
    bindToController: true
    controller: [
      '$scope'
      ($scope) ->
        if @bouldering
          @routeType = 'bouldering'
        else if @toprope
          @routeType = 'toprope'
        else if @lead
          @routeType = 'lead'
        return
    ]
    controllerAs: 'ssRouteType'
  }
 ]
