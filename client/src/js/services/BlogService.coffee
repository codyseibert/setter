###jslint nomen: true ###

###global angular: false, btoa: false, console: false, confirm: false, moment: false ###

angular.module('SETTER').factory 'BlogService', [
  '$http'
  ($http) ->
    'use strict'
    {
      getPosts: ->
        $http
          method: 'GET'
          url: 'api/blog/'
      updatePost: (pBlogId, pHtml) ->
        $http
          method: 'POST'
          url: 'api/blog/' + pBlogId
          data: html: pHtml
      createPost: (pHtml) ->
        $http
          method: 'POST'
          url: 'api/blog/'
          data: html: pHtml

    }
]
