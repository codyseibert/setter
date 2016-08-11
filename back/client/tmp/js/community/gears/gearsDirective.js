module.exports = [
  '$rootScope', '$q', '$stateParams', 'DiscussionService', 'LoginService', 'lodash', function($rootScope, $q, $stateParams, DiscussionService, LoginService, _) {
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
        scope["delete"] = function(gear) {
          var isYes;
          isYes = confirm('are you sure you want to delete this gear post?');
          if (!isYes) {
            return;
          }
          return DiscussionService["delete"](gear).then(function() {
            return scope.gears.splice(scope.gears.indexOf(gear), 1);
          });
        };
        scope.owns = function(gear) {
          return LoginService.user.id === gear.accountId;
        };
        scope.update = function(gear) {
          return DiscussionService.update(gear).then(function() {
            return gear.creating = false;
          });
        };
        return scope.save = function() {
          return DiscussionService.create(scope.gear).then(function(gear) {
            scope.gears.push(gear);
            return scope.creating = false;
          });
        };
      },
      templateUrl: 'community/gears/gears.html'
    };
  }
];
