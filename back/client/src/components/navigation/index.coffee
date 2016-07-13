module.exports = [
  '$rootScope'
  '$stateParams'
  (
    $rootScope
    $stateParams
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      scope.$watch ->
        $stateParams.gymId
      , (newValue) ->
        scope.gymId = newValue

    templateUrl: 'components/navigation/template.html'

]
