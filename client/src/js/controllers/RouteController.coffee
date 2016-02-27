###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false, confirm: false ###

angular.module('SETTER').controller 'RouteController', [
  '$scope'
  '$rootScope'
  '$routeParams'
  '$q'
  'RoutesService'
  'CommentsService'
  'RatingsService'
  'SendsService'
  'WallsService'
  'LoginService'
  'GymsService'
  'ProjectsService'
  'SelectedRouteService'
  'MessageService'
  ($scope, $rootScope, $routeParams, $q, RoutesService, CommentsService, RatingsService, SendsService, WallsService, LoginService, GymsService, ProjectsService, SelectedRouteService, MessageService) ->
    'use strict'
    $scope.newValue = 0
    $scope.$watch (->
      SelectedRouteService.getSelectedRoute()
    ), (newValue, oldValue) ->
      if newValue != oldValue
        $scope.routeId = newValue.id
        $scope.gymId = newValue.gym_id
        $scope.wallId = newValue.wall_id
        $scope.loading = true
        loadRouteData()
        GymsService.getGymSettings($scope.gymId).success (pData) ->
          $scope.settings = pData
          return
      return
    $scope.form = {}
    $scope.stars = []
    $scope.comments = []
    i = undefined
    (->
      i = 0
      while i < 5
        $scope.stars.push rating: i + 0.5
        i += 1
      return
    )()

    loadRating = ->
      RatingsService.getRatingForRoute($scope.routeId).success (pData) ->
        $scope.rating = Math.round(pData.rating * 10) / 10
        $scope.ratingCount = pData.count
        $rootScope.routeRated = [
          $scope.routeId
          $scope.rating
        ]
        return

    loadRouteData = ->
      a = RoutesService.setRouteAsViewed($scope.routeId).success((pData) ->
        WallsService.setWallsDirty $scope.gymId
        RoutesService.setRoutesDirty $scope.gymId, $scope.wallId
        return
      )
      b = RoutesService.getRoute($scope.routeId).success((pData) ->
        pData.date = pData.date
        $scope.route = pData
        return
      )
      c = CommentsService.getCommentsAboutRoute($scope.routeId).success((pData) ->
        $scope.comments = pData
        i = 0
        while i < pData.length
          pData[i].date = pData[i].date
          i += 1
        return
      )
      d = loadRating()
      e = RatingsService.hasRated($scope.routeId).success((pData) ->
        if pData.error
          $scope.hasRated = false
        else
          $scope.hasRated = true
        return
      )
      f = SendsService.getSendsForRoute($scope.routeId).success((pData) ->
        $scope.sends = pData
        return
      )
      g = SendsService.hasSent($scope.routeId).success((pData) ->
        if pData.error
          $scope.hasSent = false
        else
          $scope.hasSent = true
        return
      )
      h = ProjectsService.isProject($scope.routeId).success((pData) ->
        `var i`
        if pData.error
          $scope.isProject = false
        else
          $scope.isProject = true
        return
      )
      i = ProjectsService.getProjectsForRoute($scope.routeId).success((pData) ->
        $scope.projects = pData
        return
      )
      $q.all([
        a
        b
        c
        d
        e
        f
        g
        h
        i
      ]).then ->
        $scope.loading = false
        $scope.route.sent = $scope.hasSent
        return
      return

    $scope.addComment = ->
      CommentsService.createComment($scope.routeId, $scope.form.message).success (pData) ->
        $scope.comments.push
          id: pData.id
          account_id: $scope.getAccountId()
          message: $scope.form.message
          date: moment()
          url: LoginService.getImageUrl()
          name: LoginService.getName()
        $scope.form.message = ''
        return
      return

    $scope.hasComments = ->
      $scope.comments.length > 0

    $scope.send = ->
      angular.element('.modal').foundation 'reveal', 'open'
      SendsService.createSend($scope.routeId).success ->
        MessageService.send 'routeSent', $scope.route
        $scope.hasSent = true
        $rootScope.sendRoute = $scope.routeId
        $scope.sends.push
          account_id: $scope.getAccountId()
          name: LoginService.getName()
          route_id: parseInt($scope.routeId, 10)
          url: LoginService.getImageUrl()
        return
      return

    $scope.unsend = ->
      SendsService.deleteSend($scope.routeId).success ->
        accountId = undefined
        MessageService.send 'routeUnsent', $scope.route
        accountId = $scope.getAccountId()
        i = 0
        while i < $scope.sends.length
          if $scope.sends[i].account_id == accountId
            $scope.sends.splice i, 1
            break
          i += 1
        $scope.hasSent = false
        $rootScope.unsendRoute = $scope.routeId
        return
      return

    $scope.setHoverRating = (pStar) ->
      $scope.hoverRating = pStar.rating
      return

    $scope.rate = (pStar) ->
      RatingsService.updateRating($scope.routeId, pStar.rating).success ->
        $scope.hasRated = true
        angular.element('.modal').foundation 'reveal', 'close'
        loadRating()
        return
      return

    $scope.closeModal = ->
      angular.element('.modal').foundation 'reveal', 'close'
      return

    $scope.isFilled = (pStar) ->
      if pStar.rating <= $scope.hoverRating or pStar.rating <= $scope.rating
        return true
      false

    $scope.isHovered = (pStar) ->
      if pStar.rating <= $scope.hoverRating
        return true
      false

    $scope.edit = ->
      $rootScope.routeModalViewType = 'edit'
      return

    $scope.strip = ->
      doIt = confirm('Are you sure you want to strip this route?')
      if !doIt
        return
      RoutesService.stripRoute($scope.gymId, $scope.wallId, $scope.routeId).success (pData) ->
        $rootScope.closeRouteModal()
        $rootScope.refreshWall = true
        return
      return

    $scope.topNavigationClicked = ->
      if $scope.pageWasBookmarked() or $scope.lastPageWasZone() or $scope.lastPageWasEditRoute()
        $scope.navigateToWall $scope.gymId, $scope.wallId
      else
        $scope.back()
      return

    $scope.setAsProject = ->
      ProjectsService.createProject($scope.routeId).success (pData) ->
        $scope.isProject = true
        MessageService.send 'projectSet', $scope.route
        $scope.projects.push
          url: LoginService.getImageUrl()
          name: LoginService.getName()
        return
      return

    $scope.unsetAsProject = ->
      ProjectsService.deleteProject($scope.routeId).success (pData) ->
        $scope.isProject = false
        MessageService.send 'projectUnset', $scope.route
        $rootScope.splice $scope.projects, 'name', LoginService.getName()
        return
      return

    return
]
