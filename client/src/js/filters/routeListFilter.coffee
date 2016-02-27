angular.module('SETTER').filter 'routeFilter', ->
  (routes, input) ->
    if input == undefined or input == ''
      return routes
    input = input.toUpperCase()
    newCollection = []
    for i of routes
      route = routes[i]
      zoneName = ''
      boulderGrade = ''
      if route.boulder_grade
        boulderGrade = route.boulder_grade.toUpperCase()
      if route.zone_name
        zoneName = route.zone_name.toUpperCase()
      if route.toprope_grade == input or route.lead_grade == input or zoneName == input or boulderGrade == input
        newCollection.push route
    newCollection
