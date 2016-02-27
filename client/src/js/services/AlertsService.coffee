###jslint nomen: true ###

###global angular: false, btoa: false, console: false, confirm: false, moment: false ###

angular.module('SETTER').factory 'AlertsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getAlertsForGym: (pGymId) ->
        $http
          method: 'GET'
          url: 'api/gyms/' + pGymId + '/alerts'
      createAlert: (pGymId, pMessage) ->
        $http
          method: 'POST'
          url: 'api/gyms/' + pGymId + '/alerts'
          data: message: pMessage
      deleteAlert: (pGymId, pAlertId) ->
        $http
          method: 'DELETE'
          url: 'api/gyms/' + pGymId + '/alerts/' + pAlertId

    }
]
