angular.module('SETTER')
  .filter('routeFilter', function() {
    return function (routes, input) {

        if (input === undefined || input === '') {
          return routes
        }

        input = input.toUpperCase();

        var newCollection = []

        for (var i in routes) {
          var route = routes[i];
          var zoneName = '';
          var boulderGrade = '';

          if (route.boulder_grade) {
            boulderGrade = route.boulder_grade.toUpperCase();
          }

          if (route.zone_name) {
            zoneName = route.zone_name.toUpperCase();
          }

          if (route.toprope_grade === input
             || route.lead_grade  === input
             || zoneName  === input
             || boulderGrade === input) {
            newCollection.push(route)
          }

        }

        return newCollection;
    };
  });
