###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'ColorsService', [
  '$http'
  ($http) ->
    'use strict'
    { getColors: ->
      $http
        method: 'GET'
        url: 'api/colors'
 }
]
