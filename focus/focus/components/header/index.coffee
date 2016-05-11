module.exports = [
  '$rootScope'
  '$stateParams'
  (
    $rootScope
    $stateParams
  ) ->

    restrict: 'E'

    scope:
      model: '='

    link: (scope, elem, attr) ->
      scope.$watch ->
        $stateParams.gymId
      , (newValue) ->
        scope.gymId = newValue

    templateUrl: 'components/header/template.html'

]
