module.exports = [
  '$rootScope'
  '$state'
  'GymService'
  'AccountService'
  'LoginService'
  'jwtHelper'
  (
    $rootScope
    $state
    GymService
    AccountService
    LoginService
    jwtHelper
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      scope.gym = {}
      scope.user = {}

      scope.registerGym = ->
        GymService.create scope.gym
          .then ->
            LoginService.login scope.gym.email, scope.gym.password
          .then ->
            $state.go 'gyms.news', gymId: LoginService.user.id

      scope.registerUser = ->
        AccountService.create scope.user
          .then ->
            LoginService.login scope.user.email, scope.user.password
          .then ->
            $state.go 'findgym'

    templateUrl: 'components/landing/template.html'

]
