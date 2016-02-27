###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false ###

angular.module('SETTER').controller 'WallsController', [
  '$scope'
  '$routeParams'
  'WallsService'
  'LoginService'
  ($scope, $routeParams, WallsService, LoginService) ->
    'use strict'
    if !LoginService.validateLoggedIn()
      return
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.walls = []
    $scope.loading = true
    $scope.hasNoWalls = false
    $scope.backButtonActive = true
    $scope.form = filter: ''

    $scope.checkForWalls = (pWalls) ->
      if pWalls.length == 0
        $scope.hasNoWalls = true
      else
        return
      return

    WallsService.getWallsInGym $scope.gymId, (pData) ->
      $scope.walls = pData
      $scope.checkForWalls $scope.walls
      $scope.loading = false
      return

    $scope.addClicked = ->
      wallName = $scope.form.wallName
      WallsService.createWall($scope.gymId, wallName).success (pData) ->
        $scope.walls.push
          name: wallName
          id: pData.id
          route_count: 0
        $scope.form.wallName = ''
        WallsService.setWallsDirty $scope.gymId
        return
      return

    $scope.applyFilter = ->
      filter = $scope.form.filter.toUpperCase()
      $scope.walls.map (pEntry) ->
        if pEntry.name.toUpperCase().indexOf(filter) != -1
          pEntry.hide = false
        else
          pEntry.hide = true
        pEntry
      return

    $scope.isNew = (pWall) ->
      moment(pWall.last_update) > moment().subtract(7, 'days')

    return
]
