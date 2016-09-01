module.exports = [
  '$scope'
  '$state'
  'LoginService'
  (
    $scope
    $state
    LoginService
  ) ->

    $scope.login = ->
      LoginService.login $scope.login.email, $scope.login.password
        .then ->
          $state.go 'gyms.news', gymId: LoginService.user.id

]
