###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'FeedbackService', [
  '$http'
  ($http) ->
    'use strict'
    { createFeedback: (pName, pMessage) ->
      $http
        method: 'POST'
        url: 'api/feedback'
        data:
          name: pName
          message: pMessage
 }
]
