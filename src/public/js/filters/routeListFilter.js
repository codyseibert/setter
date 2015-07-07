angular.module('SETTER')
  .filter('routeFilter', function() {
    return function (routes, input) {

        if (input === undefined || input === '') {
          return routes
        }

        var newCollection = []

        for (var i in routes) {
          var route = routes[i];
          try {
            if (route.toprope_grade.indexOf(input) !== -1
              || route.boulder_grade.indexOf(input) !== -1
              || route.lead_grade.indexOf(input) !== -1
              || route.zone_name.indexOf(input) !== -1) {
              newCollection.push(route);
            }
          } catch (err) {}
        }

        return newCollection;
    };
  });
