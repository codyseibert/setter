angular = require 'angular'
require 'angular-scroll'
require 'angular-filter'
require 'angular-local-storage'
require 'angular-animate'
require 'angular-chart.js'
require 'ng-lodash'
require 'angular-jwt'
require 'angular-toggle-switch'
require '../../node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls'
require '../../node_modules/angular-ui-grid/ui-grid'
require 'angular-scroll'

app = require('angular').module('setter', [
  require 'angular-ui-router'
  require 'angular-resource'
  require 'angular-sanitize'
  require 'angular-moment'
  require 'ng-file-upload'
  'ngAnimate'
  'duScroll'
  'angular.filter'
  'LocalStorageModule'
  'ngLodash'
  'ui.grid'
  'ui.grid.selection'
  'ui.bootstrap'
  'toggle-switch'
  'duScroll'
  'chart.js'
  'angular-jwt'
])
app.constant 'BASE_URL', "#{location.protocol}//#{location.host}/api"
app.value('duScrollDuration', 500)
app.value('duScrollOffset', 80)
app.config require './routes'
app.config [
  'localStorageServiceProvider'
  '$httpProvider'
  (
    localStorageServiceProvider
    $httpProvider
  ) ->

    $httpProvider.interceptors.push 'APIInterceptor'

    localStorageServiceProvider
      .setPrefix 'setter'
]


require './gyms'
require './findgym'
require './finduser'
require './community'
require './login'
require './logout'
require './info'
require './viewroutes'
require './analytics'
require './members'
require './landing'
require './manageroutes'
require './register'
require './news'
require './profile'
require './setters'
require './settings'
require './zone'
require './zones'

require './models'
require './services'
require './components'

app.run [
  '$rootScope'
  '$http'
  '$state'
  '$location'
  '$stateParams'
  'LoginService'
  'localStorageService'
  (
    $rootScope
    $http
    $state
    $location
    $stateParams
    LoginService
    localStorageService
  ) ->

    $rootScope.$on "$locationChangeSuccess", (event, absNewUrl, absOldUrl) ->
      localStorageService.set 'lastPath', $location.path()

    $rootScope.isLoggedIn = ->
      LoginService.user?

    $rootScope.accountId = ->
      LoginService.user?.id

    $rootScope.hasHomeGymId = ->
      LoginService.user?.homeGymId?

    $rootScope.getHomeGymId = ->
      LoginService.user?.homeGymId

    $rootScope.isGymAccount = ->
      !!LoginService.user?.isGymAccount

    $rootScope.isGymAdmin = ->
      $rootScope.isGymAccount() and $stateParams.gymId is "#{LoginService.user.id}"

    if $rootScope.isLoggedIn()
      last = localStorageService.get 'lastPath'
      if last?
        $location.path last
      else
        if $rootScope.isGymAccount()
          $state.go 'gyms.news', gymId: LoginService.user.id
        else
          $state.go 'profile', userId: LoginService.user.id
]
