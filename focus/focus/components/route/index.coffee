module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ColorService'
  'RouteService'
  (
    $rootScope
    $state
    $stateParams
    ColorService
    RouteService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->

      $rootScope.$on 'routePanel.show', ->
        scope.show = true

      ColorService.find()
        .then (colors) ->
          scope.colors = colors

    templateUrl: 'components/route/template.html'

]
