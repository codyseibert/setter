###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, Chart: false, moment: false ###

angular.module('SETTER').controller 'UserController', [
  '$scope'
  '$rootScope'
  '$routeParams'
  'LoginService'
  'UsersService'
  'BarGraphHelperService'
  'DateFormatService'
  'MessageService'
  ($scope, $rootScope, $routeParams, LoginService, UsersService, BarGraphHelperService, DateFormatService, MessageService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.userId = parseInt($routeParams.userId, 10)
    $scope.hasActivity = true
    #Used an object that contains the properties to say if they user has
    #each type of climbing
    #TODO: Implement this same approach to the gym controller
    $scope.hasRoutes =
      'bouldering': false
      'toprope': false
      'lead': false
    UsersService.getUser $scope.userId, (pData) ->
      $scope.user = pData
      if pData.bouldering_grade
        $scope.boulderGrade = 'V' + parseFloat(pData.bouldering_grade).toFixed(0)
      if pData.toprope_grade
        $scope.topRopeGrade = '5.' + parseFloat(pData.toprope_grade).toFixed(0)
      if pData.lead_grade
        $scope.leadGrade = '5.' + parseFloat(pData.lead_grade).toFixed(0)
      return
    UsersService.getUserImage $scope.userId, (pData) ->
      $scope.image = pData.url
      return
    UsersService.getActivityStream($scope.userId).success (pData) ->
      pData.map (pEntry) ->
        pEntry.date = DateFormatService.format(pEntry.date)
        pEntry
      $scope.activity = pData
      $scope.hasActivity = pData.length > 0
      return
    UsersService.getProjects($scope.userId).success (pData) ->
      pData.map (pEntry) ->
        pEntry.date = DateFormatService.format(pEntry.date)
        pEntry
      $scope.projects = pData
      if $scope.projects.length == 0
        $scope.hasNoProjects = true
      return
    UsersService.getProgressions($scope.userId).success (pData) ->
      $scope.boulderingProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'bouldering_grade')
      $scope.topropeProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'toprope_grade')
      $scope.leadProgressionGraphData = BarGraphHelperService.preprocessProgress(pData, 'lead_grade')
      return
    MessageService.listen 'projectSet', 'UserController', (pData) ->
      $scope.hasNoProjects = false
      $scope.projects.push pData
      return
    MessageService.listen 'projectUnset', 'UserController', (pData) ->
      $rootScope.splice $scope.projects, 'id', pData.id
      if $scope.checkForProjects() == false
        $scope.hasNoProjects = false
      return
    MessageService.listen 'routeSent', 'UserController', (pData) ->
      route = $rootScope.find($scope.projects, 'id', pData.id)
      if route
        route.sent = true
      return
    MessageService.listen 'routeUnsent', 'UserController', (pData) ->
      route = $rootScope.find($scope.projects, 'id', pData.id)
      if route
        route.sent = false
      return

    $scope.imageUploadCallback = (content) ->
      LoginService.setImageUrl content.url
      UsersService.setImageAsDirty LoginService.getAccountId()
      return

    $scope.loadStatisticsData = ->
      UsersService.getBoulderSends($scope.userId, 'bouldering').success (pData) ->
        $scope.boulderingSendsGraphData = BarGraphHelperService.preprocess(pData)
        $scope.checkForRoutes $scope.boulderingSendsGraphData, 'bouldering'
        return
      UsersService.getTopRopeSends($scope.userId, 'toprope').success (pData) ->
        $scope.topropeSendsGraphData = BarGraphHelperService.preprocess(pData)
        $scope.checkForRoutes $scope.topropeSendsGraphData, 'toprope'
        return
      UsersService.getLeadSends($scope.userId, 'lead').success (pData) ->
        $scope.leadSendsGraphData = BarGraphHelperService.preprocess(pData)
        $scope.checkForRoutes $scope.leadSendsGraphData, 'lead'
        return
      return

    $scope.checkForProjects = ->
      if $scope.projects.length == 0
        $scope.hasNoProjects = true
        $scope.hasNoProjects
      else
        $scope.hasNoProjects = false
        $scope.hasNoProjects

    #TO:DO Implement this same approach for the gym controller
    #to check for data for placeholders

    $scope.checkForRoutes = (pData, pRouteType) ->
      if pData.labels.length == 0
        $scope.hasRoutes[pRouteType] = true
        $scope.hasRoutes[pRouteType]
      else
        $scope.hasRoutes[pRouteType] = false
        $scope.hasRoutes[pRouteType]

    $scope.authorization = LoginService.getHeader()
    return
]
