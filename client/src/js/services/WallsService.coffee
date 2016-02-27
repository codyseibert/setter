###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'WallsService', [
  '$http'
  '$q'
  ($http, $q) ->
    'use strict'
    walls = {}
    wall = {}
    {
      clearCache: ->
        walls = {}
        wall = {}
        return
      setWallsDirty: (pGymId) ->
        delete walls[pGymId]
        return
      setWallDirty: (pWallId) ->
        delete wall[pWallId]
        return
      getWallsInGym: (pGymId, pCallback) ->
        deferred = $q.defer()
        if walls[pGymId]
          pCallback walls[pGymId]
          deferred.resolve()
          return deferred
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/walls').success (pData) ->
          walls[pGymId] = pData
          pCallback walls[pGymId]
          deferred.resolve()
          return
        deferred
      getWall: (pGymId, pWallId, pCallback) ->
        if wall[pWallId]
          pCallback wall[pWallId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId).success (pData) ->
          wall[pWallId] = pData
          pCallback wall[pWallId]
          return
        return
      createWall: (pGymId, pWallName) ->
        @setWallsDirty pGymId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls'
          data: wallName: pWallName
      updateWall: (pGymId, pWallId, pWallName) ->
        @setWallDirty pWallId
        @setWallsDirty pGymId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId
          data: wallName: pWallName
      deleteWall: (pGymId, pWallId) ->
        @setWallsDirty pGymId
        $http
          method: 'DELETE'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId
      stripZone: (pGymId, pWallId) ->
        @setWallDirty pWallId
        @setWallsDirty pGymId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/strip'
      stripColor: (pGymId, pWallId, colorId) ->
        @setWallDirty pWallId
        @setWallsDirty pGymId
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/walls/' + pWallId + '/strip/color/' + colorId

    }
]
