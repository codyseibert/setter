module.exports = [
  '$scope'
  (
    $scope
  ) ->

    $scope.gyms = [
      name: 'Aiguille Rock Climbing Center'
      address: '999 Charles Street'
      image: 'assets/images/aiguille.gif'
    ,
      name: 'Aiguille Rock Climbing Center'
      address: '999 Charles Street'
      image: 'assets/images/aiguille.gif'
    ,
      name: 'Aiguille Rock Climbing Center'
      address: '999 Charles Street'
      image: 'assets/images/aiguille.gif'
    ]

    $scope.myFilter = (gym) ->
      return true if $scope.search is '' or not $scope.search?
      gym.name.indexOf($scope.search) isnt -1

]
