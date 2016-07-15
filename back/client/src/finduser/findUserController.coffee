module.exports = [
  '$scope'
  (
    $scope
  ) ->

    $scope.users = [
      name: 'Cody Seibert'
      image: 'assets/images/aiguille.gif'
    ,
      name: 'Cody Seibert'
      image: 'assets/images/aiguille.gif'
    ,
      name: 'Cody Seibert'
      image: 'assets/images/aiguille.gif'
    ]

    $scope.myFilter = (user) ->
      return true if $scope.search is '' or not $scope.search?
      user.name.indexOf($scope.search) isnt -1

]
