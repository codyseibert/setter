angular.module('SETTER')
  .filter('routeFilter', function() {
    return function (routes, input) {

        console.log(input); 

        if (input === undefined || input === '') {
          return routes
        }

        var newCollection = []

        for (var i in routes) {
          var route = routes[i];

          //Converts to upper case if bouldering route in order to account for v and V 
          if(route.boulder_grade) {
            var boulderGrade = route.boulder_grade.toUpperCase(); 
            input = input.toUpperCase(); 
          }

          if(route.toprope_grade === input 
             ||  route.lead_grade  === input
             || boulderGrade === input) {
            newCollection.push(route)
          }

          //Old Code 
          // try {
          //   if (route.toprope_grade.indexOf(input) !== -1
          //     || route.boulder_grade.indexOf(input) !== -1
          //     || route.lead_grade.indexOf(input) !== -1
          //     || route.zone_name.indexOf(input) !== -1) {
          //     newCollection.push(route);
          //   }
          // } catch (err) {}
        }

        return newCollection;
    };
  });
