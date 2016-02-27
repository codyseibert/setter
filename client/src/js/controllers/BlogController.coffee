angular.module('SETTER').controller 'BlogController', [
  '$scope'
  '$sce'
  'BlogService'
  'DateFormatService'
  'LoginService'
  ($scope, $sce, BlogService, DateFormatService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    BlogService.getPosts().success (pData) ->
      i = undefined
      post = undefined
      i = 0
      while i < pData.length
        post = pData[i]
        post.original_html = post.html
        post.edit_html = post.original_html
        post.html = $sce.trustAsHtml(post.html)
        post.date = DateFormatService.format(post.date)
        i += 1
      $scope.posts = pData
      return

    $scope.isAdmin = ->
      $scope.getAccountId() == 1

    $scope.edit = (pPost) ->
      pPost.isEditMode = true
      pPost.edit_html = pPost.original_html
      return

    $scope.save = (pPost) ->
      pPost.isEditMode = false
      pPost.original_html = pPost.edit_html
      pPost.html = $sce.trustAsHtml(pPost.edit_html)
      BlogService.updatePost(pPost.id, pPost.edit_html).success ->
        angular.noop()
        return
      return

    $scope.cancel = (pPost) ->
      pPost.isEditMode = false
      return

    $scope.post = ->
      BlogService.createPost($scope.new_html).success (pData) ->
        post =
          id: pData.id
          html: $sce.trustAsHtml($scope.new_html)
          date: DateFormatService.format(moment())
        $scope.posts.unshift post
        $scope.new_html = ''
        return
      return

    return
]
