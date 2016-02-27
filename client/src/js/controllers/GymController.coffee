###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false ###

angular.module('SETTER').controller 'GymController', [
  '$scope'
  '$routeParams'
  '$rootScope'
  '$interval'
  '$timeout'
  'GymsService'
  'RoutesService'
  'BarGraphHelperService'
  'UsersService'
  'LoginService'
  'AlertsService'
  'GymUsersService'
  ($scope, $routeParams, $rootScope, $interval, $timeout, GymsService, RoutesService, BarGraphHelperService, UsersService, LoginService, AlertsService, GymUsersService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    createBoulderRoutesBarGraph = undefined
    createTopRopeRoutesBarGraph = undefined
    createLeadRoutesBarGraph = undefined
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $rootScope.gymId = $scope.gymId
    $scope.showOnlyActive = true
    $scope.BOULDERING = 'Bouldering'
    $scope.TOPROPE = 'Top Rope'
    $scope.LEAD = 'Lead'
    # Displaying Tab Logic
    $scope.PANEL_SOCIAL = 'social'
    $scope.PANEL_ACTIVITY = 'activity'
    $scope.PANEL_STATS = 'stats'
    $scope.PANEL_CLIMBERS = 'climbers'
    $scope.currentTab = $scope.PANEL_SOCIAL
    $scope.PANEL_SOCIAL = 'SOCIAL'
    $scope.PANEL_ACTIVITY = 'ACTIVITY'
    $scope.PANEL_STATS = 'STATS'
    $scope.PANEL_CLIMBERS = 'CLIMBERS'
    $scope.panel = $scope.PANEL_SOCIAL
    $scope.options = {}
    $scope.form = {}
    $scope.typeNewest = $scope.BOULDERING
    $scope.typeNewestCurrent = $scope.BOULDERING
    $scope.typeBest = $scope.BOULDERING
    $scope.typeBestCurrent = $scope.BOULDERING
    $scope.activity = []
    $scope.newRoutes = []
    $scope.alerts = []
    $scope.boulderRoutesBarGraph = []
    $scope.topRopeRoutesBarGraph = []
    $scope.leadRoutesBarGraph = []
    $scope.users = []
    $scope.routeSelected = false
    $scope.offCanvasModalShown = false
    #Variables for Placeholders on gym's template
    #TO:DO These neeed to be refactored like the user controller
    #where it is one single function and an object contains the properties
    #SEE: UserController line 37 and 160
    $scope.hasNoBoulderRoutes = false
    $scope.hasNoTopRopeRoutes = false
    $scope.hasNoLeadRoutes = false
    $scope.hasNoComments = false
    $scope.hasNoProjects = false
    $scope.hasNoClimberActivity = false

    ###
    *   SECTION - Gym related service calls
    ###

    GymsService.getGym $scope.gymId, (pData) ->
      $scope.gym = pData
      $scope.gymName = $scope.gym.name
      return

    loadClimberPanelData = ->
      GymsService.getHomeGymUsers $scope.gymId, (pData) ->
        $scope.users = pData
        return
      GymUsersService.getUserGrades('bouldering').query { gymId: $scope.gymId }, (pData) ->
        pData.$promise.then (data) ->
          $scope.boulderingUsersGraphData = BarGraphHelperService.preprocess(data)
          if $scope.boulderingUsersGraphData.labels.length == 0
            $scope.hasNoBoulderers = true
          return
        return
      GymUsersService.getUserGrades('toprope').query { gymId: $scope.gymId }, (pData) ->
        pData.$promise.then (data) ->
          $scope.topropeUsersGraphData = BarGraphHelperService.preprocess(data)
          if $scope.topRopeRoutesBarGraph.labels.length == 0
            $scope.hasNoTopRopers = true
          return
        return
      GymUsersService.getUserGrades('lead').query { gymId: $scope.gymId }, (pData) ->
        pData.$promise.then (data) ->
          $scope.leadUsersGraphData = BarGraphHelperService.preprocess(data)
          if $scope.boulderingUsersGraphData.labels.length == 0
            $scope.hasNoLeaders = true
          return
        return
      return

    GymsService.getLatestProjects($scope.gymId).success (pData) ->
      $scope.projects = pData
      if $scope.projects.length == 0
        $scope.hasNoProjects = true
      return
    GymsService.getLatestComments($scope.gymId).success (pData) ->
      $scope.comments = pData
      if $scope.comments.length == 0
        $scope.hasNoComments = true
      return
    GymsService.getGymImage $scope.gymId, (pData) ->
      $scope.image = $rootScope.getGymImageSrc(pData)
      return
    GymsService.getNumberOfNewRoutes($scope.gymId).success (pData) ->
      $scope.newRoutes = pData
      return
    GymsService.getActivityStream($scope.gymId).success (pData) ->
      $scope.activity = pData
      if $scope.activity.length == 0
        $scope.hasNoClimberActivity = true
      return

    ###
    *   SECTION - Alerts
    ###

    AlertsService.getAlertsForGym($scope.gymId).success (pData) ->
      pData.map (pEntry) ->
        pEntry.date = pEntry.date
        pEntry
      $scope.alerts = pData
      return

    ###
    *   SECTION - TESTING ALL ROUTES GET REQUEST
    ###

    ###
    *   SECTION - Newest Routes
    ###

    GymsService.getNewestBoulder($scope.gymId).success (pData) ->
      $scope.newestBoulder = pData
      return

    ###
    *   SECTION - Best Rated Routes
    ###

    GymsService.getBestRatedBoulder($scope.gymId).success (pData) ->
      $scope.bestRatedBoulder = pData
      return
    setTimeout (->
      GymsService.getNewestTopRope($scope.gymId).success (pData) ->
        $scope.newestTopRope = pData
        return
      GymsService.getNewestLead($scope.gymId).success (pData) ->
        $scope.newestLead = pData
        return
      GymsService.getBestRatedTopRope($scope.gymId).success (pData) ->
        $scope.bestRatedTopRope = pData
        return
      GymsService.getBestRatedLead($scope.gymId).success (pData) ->
        $scope.bestRatedLead = pData
        return
      return
    ), 1000

    $scope.hasUsers = ->
      $scope.users.length > 0

    $scope.hasAnnouncements = ->
      $scope.alerts.length > 0

    $scope.hasActivity = ->
      $scope.activity.length > 0

    $scope.hasBoulder = ->
      $scope.newestBoulder and $scope.newestBoulder.length > 0

    $scope.hasTopRope = ->
      $scope.newestTopRope and $scope.newestTopRope.length > 0

    $scope.hasLead = ->
      $scope.newestLead and $scope.newestLead.length > 0

    $scope.hasRatedBoulder = ->
      $scope.bestRatedBoulder and $scope.bestRatedBoulder.length > 0

    $scope.hasRatedTopRope = ->
      $scope.bestRatedTopRope and $scope.bestRatedTopRope.length > 0

    $scope.hasRatedLead = ->
      $scope.bestRatedLead and $scope.bestRatedLead.length > 0

    ###
    *   SECTION - Scope Bindings
    ###

    $scope.setHomeGym = ->
      doIt = confirm('Are you sure you want to make ' + $scope.gymName + ' your new home gym?')
      if !doIt
        return
      UsersService.setHomeGym($scope.gymId).success ->
        $rootScope.homeGymId = $scope.gymId
        LoginService.setHomeGymId $scope.gymId
        alert $scope.gymName + ' now set as your home gym!'
        return
      return

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
      LoginService.setImageUrl content.url
      UsersService.setImageAsDirty LoginService.getAccountId()
      return

    $scope.setTypeNewest = (pType) ->
      $scope.typeNewest = pType
      $scope.typeNewestCurrent = pType
      return

    $scope.setTypeBest = (pType) ->
      $scope.typeBest = pType
      $scope.typeBestCurrent = pType
      return

    loadStatisticsPanelData = ->
      RoutesService.getDistributions($scope.gymId, 'bouldering').success (data) ->
        $scope.boulderingGraphData = BarGraphHelperService.preprocess(data)
        if $scope.boulderingGraphData.labels.length == 0
          $scope.hasNoBoulderRoutes = true
        return
      RoutesService.getDistributions($scope.gymId, 'toprope').success (data) ->
        $scope.topropeGraphData = BarGraphHelperService.preprocess(data)
        if $scope.topropeGraphData.labels.length == 0
          $scope.hasNoTopRopeRoutes = true
        return
      RoutesService.getDistributions($scope.gymId, 'lead').success (data) ->
        $scope.leadGraphData = BarGraphHelperService.preprocess(data)
        if $scope.leadGraphData.labels.length == 0
          $scope.hasNoLeadRoutes = true
        return
      return

    ###
    *   SECTION - MISC
    ###

    # We need to set authorization for the 'upload image' functionality
    $scope.authorization = LoginService.getHeader()

    $scope.setCurrentTab = (pCurrentTab) ->
      # Visually switch between tabs on the UI
      $scope.currentTab = pCurrentTab
      # Precache the data
      if pCurrentTab == $scope.PANEL_STATS
        loadStatisticsPanelData()
      else if pCurrentTab == $scope.PANEL_CLIMBERS
        loadClimberPanelData()
      else if pCurrentTab == $scope.PANEL_SOCIAL
        $timeout (->
          if $('.fb-page iframe').length == 0
            FB.XFBML.parse()
          return
        ), 500
      return

    return
]
