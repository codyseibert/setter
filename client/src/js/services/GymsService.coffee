###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'GymsService', [
  '$http'
  ($http) ->
    'use strict'
    gym = {}
    image = {}
    homeGymUsers = {}
    gyms = null
    {
      setGymImageAsDirty: ->
        image = {}
        return
      clearCache: ->
        gym = {}
        image = {}
        homeGymUsers = {}
        gyms = null
        return
      registerGym: (pRegistrationInfo) ->
        $http
          method: 'POST'
          url: 'api/register/gym'
          data: pRegistrationInfo
      getGyms: (pCallback) ->
        if gyms
          pCallback gyms
          return
        $http(
          method: 'GET'
          url: 'api/gyms').success (pData) ->
          gyms = pData
          pCallback gyms
          return
        return
      getGymImage: (pGymId, pCallback) ->
        if image[pGymId]
          pCallback image[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/image').success (pData) ->
          image[pGymId] = pData
          pCallback image[pGymId]
          return
        return
      getGymSettings: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/settings'
      getGym: (pGymId, pCallback) ->
        if gym[pGymId]
          pCallback gym[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId).success (pData) ->
          gym[pGymId] = pData
          pCallback gym[pGymId]
          return
        return
      getLatestProjects: (pGymId, pCallback) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/projects'
      getHomeGymUsers: (pGymId, pCallback) ->
        if homeGymUsers[pGymId]
          pCallback homeGymUsers[pGymId]
          return
        $http(
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/users').success (pData) ->
          homeGymUsers[pGymId] = pData
          pCallback homeGymUsers[pGymId]
          return
        return
      getActivityStream: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/activity'
      getNumberOfNewRoutes: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/new'
      getAllCurrentRoutes: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/current'
      getBestRatedBoulder: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/boulder/best'
      getBestRatedTopRope: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/toprope/best'
      getBestRatedLead: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/lead/best'
      getNewestBoulder: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/boulder/new'
      getNewestTopRope: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/toprope/new'
      getNewestLead: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/routes/lead/new'
      getLatestComments: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/comments'

    }
]
