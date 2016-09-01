module.exports = [
  '$rootScope'
  '$stateParams'
  'GymService'
  (
    $rootScope
    $stateParams
    GymService
  ) ->

    restrict: 'E'

    scope:
      model: '='

    link: (scope, elem, attr) ->
      GymService.get $stateParams.gymId
        .then (gym) ->
          scope.gym = gym

    templateUrl: 'components/banner/template.html'

]
