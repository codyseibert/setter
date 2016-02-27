
angular.module('SETTER').controller 'routeSearchController', [
  '$scope'
  '$routeParams'
  '$rootScope'
  '$interval'
  '$filter'
  'GymsService'
  'RoutesService'
  'BarGraphHelperService'
  'UsersService'
  'LoginService'
  'AlertsService'
  'GymUsersService'
  ($scope, $routeParams, $rootScope, $interval, $filter, GymsService, RoutesService, BarGraphHelperService, UsersService, LoginService, AlertsService, GymUsersService) ->
    'use strict'
    $scope.gymId = parseInt($routeParams.gymId)
    $scope.loading = true
    $scope.routes = []
    $scope.routeSelected = false
    GymsService.getGym $scope.gymId, (pData) ->
      $scope.gym = pData
      $scope.gymName = $scope.gym.name
      return
    GymsService.getAllCurrentRoutes($scope.gymId).success((pData) ->
      $scope.routes = pData
      $scope.loading = false
      return
    ).error ->
      $scope.loading = false
      return
    #Wathces for user sending/unsending routes
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

    $scope.openRouteModal = (route) ->
      found = undefined
      $rootScope.openRouteModal route
      found = $filter('filter')($scope.routes, { id: route.id }, true)
      found[0].isNew = null
      return

    return
]
