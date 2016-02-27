###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'CommentsService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getCommentsAboutRoute: (pRouteId) ->
        $http
          method: 'GET'
          url: 'api/routes/' + pRouteId + '/comments'
      createComment: (pRouteId, pMessage) ->
        $http
          method: 'POST'
          url: 'api/routes/' + pRouteId + '/comments'
          data: message: pMessage
      updateComment: (pCommentId, pMessage) ->
        $http
          method: 'POST'
          url: 'api/comments/' + pCommentId
          data: message: pMessage
      deleteComment: (pCommentId) ->
        $http
          method: 'DELETE'
          url: 'api/comments/' + pCommentId

    }
]
