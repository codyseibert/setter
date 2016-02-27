###global angular: false, btoa: false, Chart: false, confirm: false, FastClick: false, console: false, $: false ###

angular.module('SETTER', [
  'ngRoute'
  'ngCookies'
  'ngAnimate'
  'ngUpload'
  'ngResource'
  'LocalStorageModule'
  'pasvaz.bindonce'
  'angularSpinner'
  'smoothScroll'
]).config([
  '$routeProvider'
  'localStorageServiceProvider'
  ($routeProvider, localStorageServiceProvider) ->
    'use strict'
    localStorageServiceProvider.setPrefix('SETTER').setStorageType 'localStorage'
    $routeProvider.when('/',
      controller: 'SplashController'
      templateUrl: 'templates/Splash.tpl.html').when('/login',
      controller: 'LoginController'
      templateUrl: 'templates/Login.tpl.html').when('/logout',
      controller: 'LogoutController'
      templateUrl: 'templates/Logout.tpl.html').when('/blog',
      controller: 'BlogController'
      templateUrl: 'templates/Blog.tpl.html').when('/settings',
      controller: 'AccountSettingsController'
      templateUrl: 'templates/AccountSettings.tpl.html').when('/password/reset',
      controller: 'PasswordResetController'
      templateUrl: 'templates/PasswordReset.tpl.html').when('/gym/register',
      controller: 'RegisterGymController'
      templateUrl: 'templates/RegisterGym.tpl.html').when('/user/register',
      controller: 'RegisterUserController'
      templateUrl: 'templates/RegisterUser.tpl.html').when('/gyms',
      controller: 'GymsController'
      templateUrl: 'templates/Gyms.tpl.html').when('/gyms/:gymId/suggestions',
      controller: 'GymSuggestionsController'
      templateUrl: 'templates/GymSuggestions.tpl.html').when('/gyms/:gymId',
      controller: 'GymController'
      templateUrl: 'templates/gym/Gym.tpl.html').when('/gyms/:gymId/alerts',
      controller: 'AlertsController'
      templateUrl: 'templates/Alerts.tpl.html').when('/gyms/:gymId/walls',
      controller: 'WallsController'
      templateUrl: 'templates/Walls.tpl.html').when('/gyms/:gymId/routesearch',
      templateUrl: 'templates/gym/routeSearch.tpl.html'
      controller: 'routeSearchController'
      controllerAs: 'routeSearch').when('/gyms/:gymId/walls/:wallId',
      controller: 'WallController'
      templateUrl: 'templates/Wall.tpl.html').when('/gyms/:gymId/walls/:wallId/routes/:routeId',
      controller: 'RouteController'
      templateUrl: 'templates/Route.tpl.html').when('/gyms/:gymId/setters',
      controller: 'SettersController'
      templateUrl: 'templates/Setters.tpl.html').when('/gyms/:gymId/setters/add',
      controller: 'AddSetterController'
      templateUrl: 'templates/AddSetter.tpl.html').when('/gyms/:gymId/routes',
      controller: 'RouteManagerController'
      templateUrl: 'templates/RouteManager.tpl.html').when('/users/:userId',
      controller: 'UserController'
      templateUrl: 'templates/user/User.tpl.html').when('/suggestions',
      controller: 'SuggestionsController'
      templateUrl: 'templates/Suggestions.tpl.html').when('/contact',
      controller: 'ContactController'
      templateUrl: 'templates/Contact.tpl.html').when('/tos',
      controller: 'TOSController'
      templateUrl: 'templates/TOS.tpl.html').when('/blank',
      controller: 'BlankController'
      templateUrl: 'templates/Blank.tpl.html').otherwise redirectTo: '/'
    return
]).run [
  '$rootScope'
  '$location'
  '$window'
  '$timeout'
  '$cookies'
  '$routeParams'
  'UsersService'
  'GymsService'
  'WallsService'
  'RoutesService'
  'LoginService'
  'DateFormatService'
  'SelectedRouteService'
  'MessageService'
  'localStorageService'
  ($rootScope, $location, $window, $timeout, $cookies, $routeParams, UsersService, GymsService, WallsService, RoutesService, LoginService, DateFormatService, SelectedRouteService, MessageService, localStorageService) ->
    'use strict'
    # Add to string prototype to do sprintf
    if !String::format

      String::format = ->
        args = arguments
        @replace /\{(\d+)\}/g, (match, number) ->
          if args[number] == 'undefined'
            return match
          args[number]

    FastClick.attach document.body
    $rootScope.alerts = []
    # Set the global cha
    $rootScope.UNRATED_STRING = 'Unrated'

    $rootScope.navigateToLogin = ->
      $location.path 'login'
      return

    $rootScope.navigateToSettings = ->
      $location.path 'settings'
      return

    $rootScope.navigateToPasswordReset = ->
      $location.path 'password/reset'
      return

    $rootScope.navigateToRegisterUser = ->
      $location.path 'user/register'
      return

    $rootScope.navigateToRegisterGym = ->
      $location.path 'gym/register'
      return

    $rootScope.navigateToLogout = ->
      doIt = confirm('Are you sure you want to log out?')
      if doIt
        $location.path 'logout'
      return

    $rootScope.navigateToContact = ->
      $location.path 'contact'
      return

    $rootScope.navigateToTOS = ->
      $location.path 'tos'
      return

    $rootScope.navigateToHome = ->
      $location.path 'login'
      return

    $rootScope.navigateToAccountSettings = ->
      $location.path 'settings'
      return

    $rootScope.navigateToWalls = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/walls'
      return

    $rootScope.navigateToWall = (pGymId, pWallId) ->
      $location.path 'gyms/' + pGymId + '/walls/' + pWallId
      return

    $rootScope.navigateToGymRouteSearch = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/routesearch'
      return

    $rootScope.navigateToGyms = ->
      $location.path 'gyms'
      return

    $rootScope.navigateToGym = (pGymId) ->
      $location.path 'gyms/' + pGymId
      return

    $rootScope.navigateToCreateRoute = (pGymId, pWallId) ->
      $location.path 'gyms/' + pGymId + '/walls/' + pWallId + '/routes/create'
      return

    $rootScope.navigateToSetters = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/setters'
      return

    $rootScope.navigateToAddSetters = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/setters/add'
      return

    $rootScope.navigateToRoute = (pGymId, pWallId, pRouteId) ->
      $location.path 'gyms/' + pGymId + '/walls/' + pWallId + '/routes/' + pRouteId
      return

    $rootScope.navigateToEditRoute = (pGymId, pWallId, pRouteId) ->
      $location.path 'gyms/' + pGymId + '/walls/' + pWallId + '/routes/' + pRouteId + '/edit'
      return

    $rootScope.navigateToUser = (pUserId) ->
      $location.path 'users/' + pUserId
      return

    $rootScope.navigateToSetters = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/setters'
      return

    $rootScope.navigateToSuggestionsPage = ->
      $location.path 'suggestions'
      return

    $rootScope.navigateToRouteManager = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/routes'
      return

    $rootScope.navigateToBlog = ->
      $location.path 'blog'
      return

    $rootScope.navigateToGymSuggestions = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/suggestions'
      return

    $rootScope.navigateToAlerts = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/alerts'
      return

    $rootScope.navigateToAddSetter = (pGymId) ->
      $location.path 'gyms/' + pGymId + '/setters/add'
      return

    $rootScope.back = ->
      $window.history.back()
      return

    $rootScope.isGymAccount = ->
      LoginService.isGymAccount()

    $rootScope.isSetter = ->
      LoginService.getAccessList().indexOf(gymId) >= 0

    $rootScope.isUserAccount = ->
      LoginService.isUserAccount()

    $rootScope.getAccountId = ->
      LoginService.getAccountId()

    $rootScope.isGymAdmin = ->
      $rootScope.getAccountId() == gymId

    $rootScope.isLoggedIn = ->
      LoginService.isLoggedIn()

    $rootScope.getHomeGymId = ->
      LoginService.getHomeGymId()

    $rootScope.showAlerts = (pAlerts) ->
      angular.element('.alert-modal').foundation 'reveal', 'open'
      $rootScope.alerts = pAlerts
      return

    if localStorageService.get('cookies')
      $cookies = localStorageService.get('cookies')
    if LoginService.hasTokenInCookie()
      LoginService.setHeaderFromCookie()
      LoginService.setTypeFromCookie()
      LoginService.setAccountIdFromCookie()
      LoginService.setHomeGymIdFromCookie()
      LoginService.setImageUrlFromCookie()
      LoginService.setNameFromCookie()
      LoginService.setGymNameFromCookie()
      LoginService.setAccessListFromCookie()
      $rootScope.imageUrl = LoginService.getImageUrl()

    $rootScope.getAccountName = ->
      LoginService.getName()

    $rootScope.formatGrade = (pBoulderGrade, pTopRopeGrade, pLeadGrade) ->
      pBoulderGrade or pTopRopeGrade or pLeadGrade or 'Not Rated'

    $rootScope.splice = (pArray, pKey, pValue) ->
      i = pArray.length - 1
      while i >= 0
        if pArray[i][pKey] == pValue
          pArray.splice i, 1
        i--
      return

    $rootScope.find = (pArray, pKey, pValue) ->
      i = pArray.length - 1
      while i >= 0
        if pArray[i][pKey] == pValue
          return pArray[i]
        i--
      return

    paths = [ '/' ]
    userReg = /users\/[0-9]+$/
    settersReg = /gyms\/[0-9]+\/setters$/
    addSettersReg = /gyms\/[0-9]+\/setters\/add$/
    gymsReg = /gyms\/[0-9]+$/
    searchGymsReg = /gyms$/
    zonesReg = /gyms\/[0-9]+\/walls$/
    zoneReg = /gyms\/[0-9]+\/walls\/[0-9]+$/
    routeReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes\/[0-9]+$/
    routesReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes$/
    editRouteReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes\/[0-9]+\/edit$/
    createRouteReg = /gyms\/[0-9]+\/walls\/[0-9]+\/routes\/create$/
    gymId = undefined
    nothing = undefined
    userId = undefined
    $rootScope.$on '$routeChangeSuccess', ->
      currentPath = undefined
      lastPath = undefined
      currentPath = $location.$$path
      lastPath = paths[0]
      $rootScope.lastPath = lastPath
      paths.push currentPath
      paths.splice 0, 1
      $rootScope.closeRouteModal()
      # Always slide right (handles back logic)
      $rootScope.slideInRight = false
      if $rootScope.currentPageIsGyms() and $rootScope.lastPageWasUser()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsSearchGyms() and $rootScope.lastPageWasUser()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsZones() and $rootScope.lastPageWasGyms()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsZone() and $rootScope.lastPageWasZones()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsRoute() and $rootScope.lastPageWasZone()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsEditRoute() and $rootScope.lastPageWasRoute()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsCreateRoute() and $rootScope.lastPageWasZone()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsRoute() and $rootScope.lastPageWasUser()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsRoute() and $rootScope.lastPageWasGyms()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsGyms() and $rootScope.lastPageWasSearchGyms()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsAddSetters() and $rootScope.lastPageWasSetters()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsUser() and $rootScope.lastPageWasSetters()
        $rootScope.slideInRight = true
      if $rootScope.currentPageIsZone()
        $rootScope.hideZoneDropDown = true
      else
        $rootScope.hideZoneDropDown = false
      # TODO: FIX ME
      $('.page').removeClass 'slide-in-right'
      $('.page').removeClass 'slide-in-left'
      if $rootScope.slideInRight
        $('.page').addClass 'slide-in-right'
      else
        $('.page').addClass 'slide-in-left'
      #$rootScope.$apply();
      return

    $rootScope.pageWasBookmarked = ->
      $rootScope.lastPath == '/'

    # Current Page Check Logic

    $rootScope.currentPageIsRouteArchive = ->
      $location.$$path.match routesReg

    $rootScope.currentPageIsGyms = ->
      $location.$$path.match gymsReg

    $rootScope.currentPageIsSearchGyms = ->
      $location.$$path.match searchGymsReg

    $rootScope.currentPageIsZones = ->
      $location.$$path.match zonesReg

    $rootScope.currentPageIsZone = ->
      $location.$$path.match zoneReg

    $rootScope.currentPageIsRoute = ->
      $location.$$path.match routeReg

    $rootScope.currentPageIsEditRoute = ->
      $location.$$path.match editRouteReg

    $rootScope.currentPageIsCreateRoute = ->
      $location.$$path.match createRouteReg

    $rootScope.currentPageIsUser = ->
      $location.$$path.match userReg

    $rootScope.currentPageIsSetters = ->
      $location.$$path.match settersReg

    $rootScope.currentPageIsAddSetters = ->
      $location.$$path.match addSettersReg

    $rootScope.currentPageIsOtherUser = (pRouteUserId) ->
      $rootScope.getAccountId() != parseInt(pRouteUserId)

    # Last Page Check Logic

    $rootScope.lastPageWasRouteArchive = ->
      $rootScope.lastPath.match(routesReg) != null

    $rootScope.lastPageWasSearchGyms = ->
      $rootScope.lastPath.match(searchGymsReg) != null

    $rootScope.lastPageWasGyms = ->
      $rootScope.lastPath.match(gymsReg) != null

    $rootScope.lastPageWasZones = ->
      $rootScope.lastPath.match(zonesReg) != null

    $rootScope.lastPageWasZone = ->
      $rootScope.lastPath.match(zoneReg) != null

    $rootScope.lastPageWasRoute = ->
      $rootScope.lastPath.match(routeReg) != null

    $rootScope.lastPageWasEditRoute = ->
      $rootScope.lastPath.match(editRouteReg) != null

    $rootScope.lastPageWasCreateRoute = ->
      $rootScope.lastPath.match(createRouteReg) != null

    $rootScope.lastPageWasUser = ->
      $rootScope.lastPath.match(userReg) != null

    $rootScope.lastPageWasSetters = ->
      $rootScope.lastPath.match(settersReg) != null

    # Back Button Variables to hide/show menu and back button
    #Begins set to false
    $rootScope.backButtonActive = false

    $rootScope.getGymImageSrc = (pData) ->
      if !pData or !pData.url or pData.url == ''
        return 'images/no_gym_image.png'
      pData.url

    $rootScope.getWallImageSrc = (pData) ->
      if !pData or !pData.url or pData.url == ''
        return 'images/no_gym_image.png'
      pData.url

    $rootScope.getUserImageSrc = (pData) ->
      if !pData or !pData.url or pData.url == ''
        return 'images/no_image.png'
      pData.url

    $rootScope.getImageUrlString = ->
      'url(' + LoginService.getImageUrl() + ')'

    if $rootScope.isUserAccount()
      $rootScope.userName = $rootScope.getAccountName()

    ###
        Used for forcing the data to be loaded directly up front and cached.
    ###

    if LoginService.isLoggedIn()
      LoginService.init()
      gymId = LoginService.getHomeGymId() or LoginService.getAccountId()

      nothing = ->
        undefined

      userId = null
      GymsService.getGyms nothing
      GymsService.getGym gymId, nothing
      GymsService.getGymImage gymId, nothing
      GymsService.getHomeGymUsers gymId, nothing
      RoutesService.getCurrentBoulderRoutes gymId, nothing
      RoutesService.getCurrentTopRopeRoutes gymId, nothing
      RoutesService.getCurrentLeadRoutes gymId, nothing
      WallsService.getWallsInGym gymId, nothing
      if $rootScope.isUserAccount()
        userId = LoginService.getAccountId()

        nothing = ->
          undefined

        UsersService.getUser userId, nothing
        UsersService.getUserImage userId, nothing

    $rootScope.formatDates = (pData) ->
      i = undefined
      length = undefined
      i = 0
      length = pData.length
      while i < length
        pData[i].date_format = DateFormatService.format(pData[i].date)
        i += 1
      return

    $rootScope.isModalOpen = ->
      $rootScope.displayModal

    $rootScope.openModal = ->
      $rootScope.displayModal = true
      return

    $rootScope.closeModal = ->
      $rootScope.displayModal = false
      return

    $rootScope.openRouteModal = (route) ->
      route = angular.extend({}, route)
      $rootScope.openModal()
      # Hack needed to fix the activity not containing similar id structure
      if route.route_id != undefined
        route.id = route.route_id
      $rootScope.routeSelected = route
      $rootScope.routeModalViewType = 'view'
      SelectedRouteService.setSelectedRoute route
      $timeout (->
        debugger
        $('#modal_focus_me').focus()
        $('#modal_focus_me').click()
        return
      ), 500
      return

    $rootScope.closeRouteModal = ->
      $rootScope.closeModal()
      $rootScope.routeSelected = null
      return

    $rootScope.openCreateRouteModal = ->
      $rootScope.gymId = $rootScope.getAccountId()
      MessageService.send 'gymId', $rootScope.gymId
      $rootScope.openModal()
      $rootScope.routeModalViewType = 'create'
      return

    return
]
