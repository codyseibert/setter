module.exports = [
  '$rootScope', '$state', '$stateParams', 'ZoneService', 'FileService', function($rootScope, $state, $stateParams, ZoneService, FileService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        ZoneService.get($stateParams.zoneId).then(function(zone) {
          return scope.zone = zone;
        });
        return scope.upload = function(file, key) {
          return FileService.upload(file).then(function(data) {
            scope.zone[key] = data;
            return ZoneService.update(scope.zone);
          });
        };
      },
      templateUrl: 'components/preview/template.html'
    };
  }
];
