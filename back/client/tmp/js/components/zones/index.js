module.exports = [
  '$rootScope', '$state', '$stateParams', 'ZoneService', function($rootScope, $state, $stateParams, ZoneService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        scope.form = {};
        scope.form.gymId = $stateParams.gymId;
        ZoneService.find({
          gymId: $stateParams.gymId
        }).then(function(zones) {
          return scope.zones = zones;
        });
        return scope.submit = function() {
          return ZoneService.create(scope.form).then(function(zone) {
            return scope.zones.push(zone);
          });
        };
      },
      templateUrl: 'components/zones/template.html'
    };
  }
];
