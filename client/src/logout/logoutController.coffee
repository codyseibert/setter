module.exports = [
  '$scope'
  '$state'
  'LoginService'
  (
    $scope
    $state
    LoginService
  ) ->

    LoginService.logout()
    $state.go 'landing'

]
