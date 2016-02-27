###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'ProjectsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getProjectsForRoute: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/projects'
      isProject: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/isProject'
      createProject: (pRouteId) ->
        $http
          method: 'POST'
          url: 'api/routes/' + pRouteId + '/projects'
      deleteProject: (pRouteId) ->
        $http
          method: 'DELETE'
          url: 'api/routes/' + pRouteId + '/projects'

    }
]
