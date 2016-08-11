module.exports = [
  '$rootScope', '$q', '$stateParams', 'DiscussionService', 'LoginService', function($rootScope, $q, $stateParams, DiscussionService, LoginService) {
    return {
      restrict: 'E',
      scope: {
        gears: '='
      },
      link: function(scope, elem, attr) {
        var GEAR;
        GEAR = 1;
        scope.gear = {};
        scope.gear.gymId = $stateParams.gymId;
        scope.gear.accountId = LoginService.user.id;
        scope.gear.type = GEAR;
        scope.creating = false;
        scope.create = function() {
          return scope.creating = true;
        };
        scope.save = function() {
          return DiscussionService.create(scope.gear).then(function(gear) {
            scope.gears.push(gear);
            return scope.creating = false;
          });
        };
        return scope.cancel = function() {
          return scope.creating = false;
        };
      },
      templateUrl: 'community/gears/gearsBlankState.html'
    };
  }
];
