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
      scope.gym = {}
      scope.user = {}

      scope.registerGym = ->
        GymService.create scope.gym
          .then (gym) ->
            $state.go 'gyms.news', gymId: gym.id

    templateUrl: 'components/landing/template.html'

]
