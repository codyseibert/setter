###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false, confirm: false ###

###
    Controller:
        WallController

    Template:
        Wall.tpl.html
###

angular.module('SETTER').controller 'WallController', [
  '$scope'
  '$rootScope'
  '$interval'
  '$routeParams'
  '$filter'
  '$timeout'
  'RoutesService'
  'WallsService'
  'DateFormatService'
  'LoginService'
  'SelectedRouteService'
  'ColorsService'
  ($scope, $rootScope, $interval, $routeParams, $filter, $timeout, RoutesService, WallsService, DateFormatService, LoginService, SelectedRouteService, ColorsService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    knownColors = {}
    $scope.colors = []
    $scope.colorToStrip = ''

    ###
        Init
    ###

    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.wallId = parseInt($routeParams.wallId, 10)
    $rootScope.gymId = $scope.gymId
    $rootScope.wallId = $scope.wallId
    $scope.wall = {}
    $scope.routes = []
    $scope.form = {}
    $scope.image = null
    $scope.hasNoRoutes = false
    $scope.routeSelected = false
    $scope.loading = true

    ###
        Hide / Show Logic Logic
    ###

    $scope.checkForRoutes = (pRoutes) ->
      if pRoutes.length == 0
        $scope.hasNoRoutes = true
      else
        return
      return

    loadRoutes = ->
      RoutesService.getRoutesOnWall $scope.wallId, (pData) ->
        pData.map (pEntry) ->
          pEntry.date = moment(pEntry.date)
          pEntry
        $scope.routes.splice 0, $scope.routes.length
        Array::push.apply $scope.routes, pData
        $scope.checkForRoutes $scope.routes
        $scope.loading = false
        knownColors = {}
        $scope.colors.splice 0, $scope.colors.length
        for i of pData
          route = pData[i]
          if knownColors[route.color_id]
            continue
          knownColors[route.color_id] = true
          $scope.colors.push
            name: route.color
            value: route.color_id
        return
      return

    $scope.hasRoutes = ->
      $scope.routes.length > 0

    $scope.stripColor = (gymId, wallId, colorId) ->
      doIt = confirm('Are you sure you want to strip this color?')
      if !doIt
        return
      WallsService.stripColor(gymId, wallId, colorId).success ->
        i = $scope.routes.length - 1
        while i >= 0
          if $scope.routes[i].color_id == $scope.colorToStrip
            $scope.routes.splice i, 1
          i--
        return
      return

    $scope.$watch (->
      $rootScope.refreshWall
    ), (newValue, oldValue) ->
      if newValue == true
        WallsService.setWallDirty $scope.wallId
        loadRoutes()
        $rootScope.refreshWall = false
      return
    $scope.$watch (->
      $rootScope.sendRoute
    ), (newValue, oldValue) ->
      if newValue != null
        found = undefined
        found = $filter('filter')($scope.routes, { id: newValue }, true)
        if found.length
          found[0].send = true
        $rootScope.sendRoute = null
      return
    $scope.$watch (->
      $rootScope.unsendRoute
    ), (newValue, oldValue) ->
      if newValue != null
        found = undefined
        found = $filter('filter')($scope.routes, { id: newValue }, true)
        if found.length
          found[0].send = null
        $rootScope.unsendRoute = null
      return
    $scope.$watch (->
      $rootScope.routeRated
    ), ((newValue, oldValue) ->
      if newValue
        found = undefined
        found = $filter('filter')($scope.routes, { id: newValue[0] }, true)
        if found.length
          found[0].rating = newValue[1]
        $rootScope.routeRated = null
      return
    ), true

    ###
        REST Calls
    ###

    WallsService.getWall $scope.gymId, $scope.wallId, (pData) ->
      $scope.wall = pData
      $scope.image = $rootScope.getWallImageSrc(pData)
      return
    loadRoutes()

    ###
        Button Callbacks
    ###

    $scope.openRouteModal = (route) ->
      found = undefined
      $rootScope.openRouteModal route
      found = $filter('filter')($scope.routes, { id: route.id }, true)
      found[0].isNew = null
      return

    $scope.edit = ->
      $scope.isEditMode = !$scope.isEditMode
      $scope.form.name = $scope.wall.name
      return

    $scope.openCreateRouteModal = ->
      $rootScope.openModal()
      $rootScope.routeModalViewType = 'create'
      return

    $scope.delete = ->
      doIt = confirm('Are you sure you want to delete "' + $scope.wall.name + '"?')
      if !doIt
        return
      WallsService.deleteWall($scope.gymId, $scope.wallId).success ->
        $scope.navigateToWalls $scope.gymId
        return
      return

    $scope.save = ->
      WallsService.updateWall($scope.gymId, $scope.wallId, $scope.form.name).success ->
        $scope.isEditMode = false
        $scope.wall.name = $scope.form.name
        return
      return

    $scope.stripZone = (pGymId, pWallId) ->
      doIt = confirm('Are you sure you want to strip this entire zone?')
      if !doIt
        return
      WallsService.stripZone($scope.gymId, $scope.wallId).success ->
        $scope.routes.splice 0, $scope.routes.length
        return
      return

    $scope.shouldShowWallImage = ->
      true
      #
      # return ($scope.image && $scope.image.url && $scope.isUserAccount()) ||
      # $scope.getAccountId() === $scope.gymId;

    $scope.isNew = (pRoute) ->
      pRoute.date > moment().subtract(7, 'days')

    ###
    *   SECTION - Image
    ###

    $scope.fileNameChanged = ->
      $scope.isUploadingImage = true
      angular.element('#image_submit').trigger 'click'
      return

    $scope.imageUploadComplete = (content) ->
      $scope.isUploadingImage = false
      $scope.image = content
      return

    $scope.authorization = LoginService.getHeader()
    return
]
