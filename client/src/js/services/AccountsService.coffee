###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'AccountsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      login: ->
        $http
          method: 'POST'
          url: 'api/accounts/login'
      resetPassword: (pEmail) ->
        $http
          method: 'POST'
          url: 'api/password/reset'
          data: email: pEmail
      changePassword: (pPassword) ->
        $http
          method: 'POST'
          url: 'api/password/change'
          data: password: pPassword
      getSettings: ->
        $http
          method: 'GET'
          url: 'api/account/settings'
      updateSettings: (pSettings) ->
        $http
          method: 'POST'
          url: 'api/account/settings'
          data: pSettings

    }
]
