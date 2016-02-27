###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'RoutesService', [
  '$http'
  ($http) ->
    'use strict'
    gymRoutes = {}
    routes = {}
    boulderRouteDistribution = {}
    topropeRouteDistribution = {}
    leadRouteDistribution = {}
    currentBoulderRoutes = {}
    currentTopRopeRoutes = {}
    currentLeadRoutes = {}
    allRoutes = {}
    {
      clearCache: ->
        gymRoutes = {}
        routes = {}
        currentBoulderRoutes = {}
        currentTopRopeRoutes = {}
        currentLeadRoutes = {}
        return
      setGymRoutesDirty: (pGymId) ->
        delete gymRoutes[pGymId]
        return
      setRoutesDirty: (pGymId, pWallId) ->
        delete routes[pWallId]
        delete currentBoulderRoutes[pGymId]
        delete currentTopRopeRoutes[pGymId]
        return
      getRoutesInGym: (pGymId, pCallback) ->
        if gymRoutes[pGymId]
          pCallback gymRoutes[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes').success (pData) ->
          gymRoutes[pGymId] = pData
          pCallback gymRoutes[pGymId]
          return
        return
      getRoutesOnWall: (pWallId, pCallback) ->
        if routes[pWallId]
          pCallback routes[pWallId]
          return
        $http(
          method: 'GET'
          url: 'api/walls/' + pWallId + '/routes').success (pData) ->
          routes[pWallId] = pData
          pCallback routes[pWallId]
          return
        return
      getRoute: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId
      getDistributions: (pGymId, pType, pCallback) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/' + pType + '/dist'
      getCurrentBoulderRoutes: (pGymId, pCallback) ->
        if currentBoulderRoutes[pGymId]
          pCallback currentBoulderRoutes[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/boulder').success (pData) ->
          currentBoulderRoutes[pGymId] = pData
          pCallback currentBoulderRoutes[pGymId]
          return
        return
      getCurrentTopRopeRoutes: (pGymId, pCallback) ->
        if currentTopRopeRoutes[pGymId]
          pCallback currentTopRopeRoutes[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/toprope').success (pData) ->
          currentTopRopeRoutes[pGymId] = pData
          pCallback currentTopRopeRoutes[pGymId]
          return
        return
      getCurrentLeadRoutes: (pGymId, pCallback) ->
        if currentLeadRoutes[pGymId]
          pCallback currentLeadRoutes[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/lead').success (pData) ->
          currentLeadRoutes[pGymId] = pData
          pCallback currentLeadRoutes[pGymId]
          return
        return
      getBoulderRouteDistribution: (pGymId, pCallback) ->
        if boulderRouteDistribution[pGymId]
          pCallback boulderRouteDistribution[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/boulder/distribution').success (pData) ->
          boulderRouteDistribution[pGymId] = pData
          pCallback boulderRouteDistribution[pGymId]
          return
        return
      getTopRopeRouteDistribution: (pGymId, pCallback) ->
        if topropeRouteDistribution[pGymId]
          pCallback topropeRouteDistribution[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/toprope/distribution').success (pData) ->
          topropeRouteDistribution[pGymId] = pData
          pCallback topropeRouteDistribution[pGymId]
          return
        return
      getLeadRouteDistribution: (pGymId, pCallback) ->
        if leadRouteDistribution[pGymId]
          pCallback leadRouteDistribution[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/lead/distribution').success (pData) ->
          leadRouteDistribution[pGymId] = pData
          pCallback leadRouteDistribution[pGymId]
          return
        return
      createRoute: (pGymId, pWallId, pName, pColorId, pType, pBoulderGradeId, pTopRopeGradeId, pLeadGradeId, pSetterId, pNote) ->
        @setGymRoutesDirty pGymId
        @setRoutesDirty pGymId, pWallId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/routes'
          data:
            name: pName
            colorId: pColorId
            type: pType
            boulderGradeId: pBoulderGradeId
            topRopeGradeId: pTopRopeGradeId
            leadGradeId: pLeadGradeId
            setterId: pSetterId
            note: pNote
      updateRoute: (pGymId, pWallId, pRouteId, pName, pColorId, pType, pBoulderGradeId, pTopRopeGradeId, pLeadGradeId, pSetterId, pNote) ->
        @setGymRoutesDirty pGymId
        @setRoutesDirty pGymId, pWallId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/routes/' + pRouteId
          data:
            name: pName
            colorId: pColorId
            type: pType
            boulderGradeId: pBoulderGradeId
            topRopeGradeId: pTopRopeGradeId
            leadGradeId: pLeadGradeId
            setterId: pSetterId
            note: pNote
      deleteRoute: (pGymId, pWallId, pRouteId) ->
        @setGymRoutesDirty pGymId
        @setRoutesDirty pGymId, pWallId
        $http
          method: 'DELETE'
          url: 'api/gyms/' + pGymId + '/routes/' + pRouteId
      stripRoute: (pGymId, pWallId, pRouteId) ->
        @setGymRoutesDirty pGymId
        @setRoutesDirty pGymId, pWallId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/routes/' + pRouteId + '/strip'
      setRouteAsViewed: (pRouteId) ->
        $http
          method: 'DELETE'
          url: 'api/routes/' + pRouteId + '/setAsViewed'

    }
]
