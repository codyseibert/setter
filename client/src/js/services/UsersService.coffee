###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'UsersService', [
  '$http'
  ($http) ->
    'use strict'
    user = {}
    image = {}
    projects = []
    {
      setImageAsDirty: (pUserId) ->
        delete image[pUserId]
        return
      registerUser: (pRegistrationInfo) ->
        $http
          method: 'POST'
          url: 'api/register/user'
          data: pRegistrationInfo
      getUser: (pUserId, pCallback) ->
        if user[pUserId]
          pCallback user[pUserId]
          return
        $http(
          method: 'GET'
          url: 'api/users/' + pUserId).success (pData) ->
          user[pUserId] = pData
          pCallback user[pUserId]
          return
        return
      getUserImage: (pUserId, pCallback) ->
        if image[pUserId]
          pCallback image[pUserId]
          return
        $http(
          method: 'GET'
          url: 'api/users/' + pUserId + '/image').success (pData) ->
          image[pUserId] = pData
          pCallback image[pUserId]
          return
        return
      getUserSendDistributions: (pUserId, pType) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/sends/' + pType
      getBoulderSends: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/sends/boulder'
      getTopRopeSends: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/sends/toprope'
      getLeadSends: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/sends/lead'
      setHomeGym: (pGymId) ->
        $http
          method: 'POST'
          url: 'api/users/homegym/set'
          data: gymId: pGymId
      getActivityStream: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/activity'
      getProjects: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/projects'
      getProgressions: (pUserId) ->
        $http
          method: 'GET'
          url: 'api/users/' + pUserId + '/progressions'
      getAlerts: ->
        $http
          method: 'GET'
          url: 'api/users/alerts'

    }
]
