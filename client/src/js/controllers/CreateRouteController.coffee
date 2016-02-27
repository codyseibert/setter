###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false, alert: false, confirm: false ###

angular.module('SETTER').controller 'CreateRouteController', [
  '$scope'
  '$rootScope'
  '$routeParams'
  '$q'
  '$timeout'
  'GradesService'
  'RoutesService'
  'ColorsService'
  'SettersService'
  'LoginService'
  'SelectedRouteService'
  'WallsService'
  'MessageService'
  ($scope, $rootScope, $routeParams, $q, $timeout, GradesService, RoutesService, ColorsService, SettersService, LoginService, SelectedRouteService, WallsService, MessageService) ->
    'use strict'
    getBoulderGradesPromise = undefined
    getRopeGradesPromise = undefined
    getColorsPromise = undefined
    getSettersPromise = undefined
    findEntry = undefined
    BOULDER_TYPE = 0
    TOPROPE_TYPE = 1
    LEAD_TYPE = 2
    cleanGrades = undefined
    loadRouteData = undefined
    init = undefined
    $scope.gymId = $rootScope.gymId
    $scope.$watch (->
      SelectedRouteService.getSelectedRoute()
    ), (newValue, oldValue) ->
      if newValue != oldValue
        $scope.routeId = newValue.id
        $scope.gymId = newValue.gym_id
        $scope.wallId = newValue.wall_id
        $scope.loading = true
        loadRouteData()
      return
    $scope.$watch (->
      $rootScope.routeModalViewType
    ), (newValue, oldValue) ->
      $scope.isEditMode = false
      if newValue == 'edit'
        $scope.isEditMode = true
      else if newValue == 'create'
        $scope.gymId = $rootScope.gymId
        init()
        cleanGrades()
      return
    $scope.$watch (->
      $scope.gymId
    ), (newValue, oldValue) ->
      if newValue
        $scope.gymId = newValue
        init()
      return
    MessageService.listen 'gymId', 'CreateRouteController', (pData) ->
      $scope.gymId = pData
      init()
      return
    $scope.$watch (->
      $rootScope.wallId
    ), (newValue, oldValue) ->
      if newValue and $scope.zones
        $scope.wallId = newValue
        init()
      return
    $scope.form = {}
    $scope.setters = []
    $scope.types = [
      {
        id: BOULDER_TYPE
        name: 'Boulder'
      }
      {
        id: TOPROPE_TYPE
        name: 'Top Rope'
      }
      {
        id: LEAD_TYPE
        name: 'Lead'
      }
    ]
    $scope.form.type = $scope.types[BOULDER_TYPE]

    ###
        Resets unselected dropdown backend-values back to default
    ###

    cleanGrades = ->
      if $scope.form.type.name == 'Boulder'
        $scope.form.topRopeGrade = $scope.ropeGrades[0]
        $scope.form.leadGrade = $scope.ropeGrades[0]
      else if $scope.form.type.name == 'Top Rope'
        $scope.form.boulderGrade = $scope.boulderGrades[0]
        $scope.form.leadGrade = $scope.ropeGrades[0]
      else if $scope.form.type.name == 'Lead'
        $scope.form.boulderGrade = $scope.boulderGrades[0]
        $scope.form.topRopeGrade = $scope.ropeGrades[0]
      return

    $scope.cancelClicked = ->
      $rootScope.routeModalViewType = 'view'
      return

    $scope.addClicked = ->
      name = $scope.form.name
      zone = $scope.form.zone.id
      type = $scope.form.type.id
      boulderGradeId = $scope.form.boulderGrade.id
      topRopeGradeId = $scope.form.topRopeGrade.id
      leadGradeId = $scope.form.leadGrade.id
      colorId = $scope.selectedColorId
      setterId = $scope.form.setter.account_id
      note = $scope.form.note
      cleanGrades()
      RoutesService.createRoute($scope.gymId, zone, name, colorId, type, boulderGradeId, topRopeGradeId, leadGradeId, setterId, note).success (pData) ->
        $scope.form.boulderGrade = $scope.boulderGrades[0]
        $scope.form.topRopeGrade = $scope.ropeGrades[0]
        $scope.form.leadGrade = $scope.ropeGrades[0]
        $scope.form.color = $scope.colors[0].id
        $scope.form.note = ''
        $scope.form.name = ''
        angular.element('.created-modal').foundation 'reveal', 'open', animation: 'fade'
        $timeout (->
          angular.element('.created-modal').foundation 'reveal', 'close', animation: 'fade'
          return
        ), 1000
        $rootScope.closeRouteModal()
        $rootScope.refreshWall = true
        WallsService.setWallsDirty $scope.gymId
        return
      return

    $scope.saveClicked = ->
      name = $scope.form.name
      zone = $scope.form.zone.id
      type = $scope.form.type.id
      boulderGradeId = $scope.form.boulderGrade.id
      topRopeGradeId = $scope.form.topRopeGrade.id
      leadGradeId = $scope.form.leadGrade.id
      colorId = $scope.selectedColorId
      setterId = $scope.form.setter.account_id
      note = $scope.form.note
      cleanGrades()
      RoutesService.updateRoute($scope.gymId, zone, $scope.routeId, name, colorId, type, boulderGradeId, topRopeGradeId, leadGradeId, setterId, note).success (pData) ->
        $rootScope.closeRouteModal()
        $rootScope.refreshWall = true
        return
      return

    $scope.hasSetters = ->
      $scope.setters.length > 0

    $scope.colorChanged = ->
      i = undefined
      i = 0
      while i < $scope.colors.length
        if $scope.colors[i].id == parseInt($scope.form.color, 10)
          $scope.text_color = $scope.colors[i].value
          break
        i += 1
      return

    $scope.selectColor = (color) ->
      $scope.selectedColorId = color
      return

    init = ->
      getBoulderGradesPromise = GradesService.getBoulderGrades().success((pData) ->
        $scope.boulderGrades = pData
        $scope.form.boulderGrade = pData[0]
        return
      )
      getRopeGradesPromise = GradesService.getRopeGrades().success((pData) ->
        $scope.ropeGrades = pData
        $scope.form.topRopeGrade = pData[0]
        $scope.form.leadGrade = pData[0]
        return
      )
      getColorsPromise = ColorsService.getColors().success((pData) ->
        $scope.colors = pData
        $scope.selectedColorId = pData[0].id
        $scope.colorChanged()
        return
      )
      getSettersPromise = SettersService.getSettersAtGym($scope.gymId).success((pData) ->
        $scope.setters = pData
        $scope.form.setter = pData[0]
        return
      )
      getZonesPromise = WallsService.getWallsInGym($scope.gymId, (pData) ->
        $scope.zones = pData
        $scope.form.zone = pData[0]
        if $scope.wallId
          $scope.form.zone = findEntry($scope.wallId, $scope.zones)
        return
      )
      $q.all [
        getBoulderGradesPromise
        getRopeGradesPromise
        getColorsPromise
        getSettersPromise
        getZonesPromise
      ], ->
        loadRouteData()
        return
      return

    loadRouteData = ->
      if !$scope.routeId
        return
      RoutesService.getRoute($scope.routeId).success (pData) ->
        $scope.form.type = findEntry(pData.type, $scope.types)
        $scope.form.zone = findEntry(pData.wall_id, $scope.zones)
        $scope.form.boulderGrade = findEntry(pData.boulder_grade_id, $scope.boulderGrades)
        $scope.form.topRopeGrade = findEntry(pData.toprope_grade_id, $scope.ropeGrades)
        $scope.form.leadGrade = findEntry(pData.lead_grade_id, $scope.ropeGrades)
        $scope.form.color = findEntry(pData.color_id, $scope.colors).id
        $scope.form.setter = findEntry(pData.setter_id, $scope.setters)
        $scope.form.note = pData.note
        $scope.form.name = pData.route_name
        $scope.selectedColorId = $scope.form.color
        $scope.colorChanged()
        $scope.loading = false
        return
      return

    findEntry = (pLookingFor, pArray) ->
      i = undefined
      entry = undefined
      i = 0
      while i < pArray.length
        entry = pArray[i]
        if entry.id == pLookingFor or entry.account_id == pLookingFor
          return entry
        i += 1
      pArray[0]

    return
]
