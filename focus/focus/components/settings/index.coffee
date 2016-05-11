module.exports = [
  '$rootScope'
  '$state'
  'GymService'
  (
    $rootScope
    $state
    GymService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      GymService.get 2
        .then (gym) ->
          scope.gym = gym

      scope.submit = ->
        GymService.update scope.gym
          .then (gym) ->

    templateUrl: 'components/settings/template.html'

]
