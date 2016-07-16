module.exports = [
  '$rootScope'
  '$state'
  'GymService'
  'LoginService'
  'jwtHelper'
  (
    $rootScope
    $state
    GymService
    LoginService
    jwtHelper
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      scope.gym = {}
      scope.user = {}

      scope.registerGym = ->
        GymService.create scope.gym
          .then (gym) ->
            LoginService.login scope.gym.email, scope.gym.password
          .then ->
            $state.go 'gyms.news', gymId: LoginService.user.id

    templateUrl: 'components/landing/template.html'

]
