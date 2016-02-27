###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'LoginService', [
  '$http'
  '$cookies'
  '$location'
  '$rootScope'
  'GymsService'
  'RoutesService'
  'WallsService'
  'UsersService'
  'localStorageService'
  ($http, $cookies, $location, $rootScope, GymsService, RoutesService, WallsService, UsersService, localStorageService) ->
    'use strict'
    USER_TYPE = 1
    GYM_TYPE = 2
    accountType = USER_TYPE
    homeGymId = null
    accountId = null
    url = null
    name = null
    gymName = null
    accessList = []
    initCalled = false
    {
      init: ->
        if initCalled
          return
        initCalled = true
        UsersService.getAlerts().success (pData) ->
          if $rootScope.isUserAccount() and pData.length > 0
            $rootScope.showAlerts pData
          return
        return
      getAccessList: ->
        accessList
      setAccessList: (gyms) ->
        accessList = gyms
        $cookies.accessList = gyms
        return
      login: (pLoginInfo) ->
        $http
          method: 'POST'
          url: 'api/login'
          data: pLoginInfo
      setHeader: (pToken) ->
        $http.defaults.headers.common.Authorization = 'Bearer ' + pToken
        $cookies.token = pToken
        return
      validateLoggedIn: ->
        if !@isLoggedIn()
          $location.path 'login'
          return false
        true
      isLoggedIn: ->
        $http.defaults.headers.common.Authorization != undefined
      setHeaderFromCookie: ->
        $http.defaults.headers.common.Authorization = 'Bearer ' + $cookies.token
        return
      setTypeFromCookie: ->
        accountType = parseInt($cookies.accountType, 10)
        return
      setAccountIdFromCookie: ->
        accountId = parseInt($cookies.accountId, 10)
        return
      setImageUrlFromCookie: ->
        url = $cookies.url
        return
      setGymNameFromCookie: ->
        if $cookies.gymName == 'null'
          gymName = null
        else
          gymName = $cookies.gymName
        return
      setHomeGymIdFromCookie: ->
        homeGymId = $cookies.homeGymId
        if $cookies.homeGymId
          homeGymId = parseInt($cookies.homeGymId, 10)
        return
      setNameFromCookie: ->
        name = $cookies.name
        return
      setAccessListFromCookie: ->
        accessList = $cookies.accessList
        return
      hasTokenInCookie: ->
        $cookies.token != undefined
      logout: ->
        delete $cookies.token
        delete $cookies.accountType
        delete $cookies.accountId
        delete $cookies.homeGymId
        delete $cookies.url
        delete $cookies.name
        delete $cookies.gymName
        delete $cookies.accessList
        delete $http.defaults.headers.common.Authorization
        localStorageService.remove 'cookies'
        WallsService.clearCache()
        GymsService.clearCache()
        RoutesService.clearCache()
        $location.path '/'
        return
      setAccountType: (pAccountType) ->
        pAccountType = parseInt(pAccountType, 10)
        accountType = pAccountType
        $cookies.accountType = pAccountType
        return
      setAccountId: (pAccountId) ->
        pAccountId = parseInt(pAccountId, 10)
        accountId = pAccountId
        $cookies.accountId = pAccountId
        return
      setHomeGymId: (pHomeGymId) ->
        if pHomeGymId
          pHomeGymId = parseInt(pHomeGymId, 10)
        homeGymId = pHomeGymId
        $cookies.homeGymId = pHomeGymId
        return
      setImageUrl: (pUrl) ->
        url = pUrl
        $cookies.url = url
        return
      setName: (pName) ->
        name = pName
        $cookies.name = pName
        return
      setGymName: (pGymName) ->
        gymName = pGymName
        $cookies.gymName = pGymName
        return
      getHomeGymId: ->
        homeGymId
      getAccountType: ->
        accountType
      getAccountId: ->
        accountId
      getImageUrl: ->
        url
      getName: ->
        gymName or name
      isGymAccount: ->
        accountType == GYM_TYPE
      isUserAccount: ->
        accountType == USER_TYPE
      getHeader: ->
        $http.defaults.headers.common.Authorization
      navigateToCorrectHomePage: ->
        if accountType == USER_TYPE
          $rootScope.navigateToGym @getHomeGymId()
        else if accountType == GYM_TYPE
          $rootScope.navigateToGym accountId
        return

    }
]
