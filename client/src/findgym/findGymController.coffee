module.exports = [
  '$scope'
  'GymService'
  (
    $scope
    GymService
  ) ->

    GymService.find()
      .then (gyms) ->
        $scope.gyms = gyms

    $scope.myFilter = (gym) ->
      return true if $scope.search is '' or not $scope.search?
      gym.name.indexOf($scope.search) isnt -1

]
