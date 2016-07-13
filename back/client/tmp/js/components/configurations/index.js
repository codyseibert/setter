module.exports = [
  '$rootScope', 'lodash', 'GymService', 'FileService', function($rootScope, _, GymService, FileService) {
    return {
      restrict: 'E',
      link: function(scope, elem, attr) {
        GymService.get(2).then(function(gym) {
          scope.gym = gym;
          return scope.gym.hideSetters = !!gym.hideSetters;
        });
        scope.submit = function() {
          return GymService.update(scope.gym).then(function(gym) {});
        };
        return scope.upload = function(file, key) {
          return FileService.upload(file).then(function(data) {
            return scope.gym[key] = data;
          });
        };
      },
      templateUrl: 'components/configurations/template.html'
    };
  }
];
