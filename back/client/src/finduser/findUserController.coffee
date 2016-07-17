module.exports = [
  '$scope'
  'AccountService'
  (
    $scope
    AccountService
  ) ->

    AccountService.find()
      .then (users) ->
        $scope.users = users
        
    $scope.myFilter = (user) ->
      return true if $scope.search is '' or not $scope.search?
      user.name.indexOf($scope.search) isnt -1

]
