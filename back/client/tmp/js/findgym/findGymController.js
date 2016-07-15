module.exports = [
  '$scope', function($scope) {
    $scope.gyms = [
      {
        name: 'Aiguille Rock Climbing Center',
        address: '999 Charles Street',
        image: 'assets/images/aiguille.gif'
      }, {
        name: 'Aiguille Rock Climbing Center',
        address: '999 Charles Street',
        image: 'assets/images/aiguille.gif'
      }, {
        name: 'Aiguille Rock Climbing Center',
        address: '999 Charles Street',
        image: 'assets/images/aiguille.gif'
      }
    ];
    return $scope.myFilter = function(gym) {
      if ($scope.search === '' || ($scope.search == null)) {
        return true;
      }
      return gym.name.indexOf($scope.search) !== -1;
    };
  }
];
