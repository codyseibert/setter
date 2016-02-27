###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false, moment: false, confirm: false ###

angular.module('SETTER').controller 'RouteManagerController', [
  '$scope'
  '$q'
  '$routeParams'
  '$timeout'
  'RoutesService'
  'GradesService'
  'DateFormatService'
  'LoginService'
  'NaturalSort'
  ($scope, $q, $routeParams, $timeout, RoutesService, GradesService, DateFormatService, LoginService, NaturalSort) ->
    'use strict'
    i = undefined
    addFilter = undefined
    getUniqueSet = undefined
    sortByValue = undefined
    boulderGradesPromise = undefined
    ropeGradesPromise = undefined
    refreshFilter = undefined
    showAllRoutes = undefined
    processRoutes = undefined
    if !LoginService.validateLoggedIn()
      return

    ###
        Scope Variables
    ###

    $scope.DISPLAY_COUNT = 30
    $scope.gymId = $routeParams.gymId
    $scope.routes = []
    $scope.filter = null
    $scope.isFilterPanelVisible = true
    $scope.options = {}
    $scope.filters = []
    $scope.form = {}
    $scope.stars = []
    $scope.finishedRendering = false
    $scope.$on 'ngRepeatFinished', (ngRepeatFinishedEvent) ->
      $scope.finishedRendering = true
      return
    $scope.BOULDERING_VIEW = 'Bouldering'
    $scope.TOPROPE_VIEW = 'Top Rope'
    $scope.LEAD_VIEW = 'Lead'
    $scope.isLoading = true
    $scope.visibleRoutes = []
    $scope.displayCount = $scope.DISPLAY_COUNT
    $scope.addedRoutes = 0
    $scope.views = [
      {
        key: 'type'
        value: 0
        name: $scope.BOULDERING_VIEW
      }
      {
        key: 'type'
        value: 1
        name: $scope.TOPROPE_VIEW
      }
      {
        key: 'type'
        value: 2
        name: $scope.LEAD_VIEW
      }
    ]
    $scope.form.view = $scope.views[0]

    $scope.loadMore = ->
      $scope.displayCount += $scope.DISPLAY_COUNT
      $scope.displayCount = Math.min($scope.getVisibleRouteCount(), $scope.displayCount)
      return

    $scope.shouldShowLoadMoreButton = ->
      if $scope.getVisibleRouteCount() > $scope.displayCount
        return true
      false

    $scope.getVisibleRouteCount = ->
      $scope.visibleRoutes.length

    ###
        Creates the stars used for displaying on the routes on template
    ###

    (->
      i = 0
      while i < 5
        $scope.stars.push rating: i + 0.5
        i += 1
      return
    )()

    addFilter = (pName, pKey, pLabel) ->
      $scope.filters.push
        name: pName
        key: pKey
        label: pLabel or pName
        sort: 0
      return

    addFilter 'Zone', 'wall_name'
    addFilter 'Color', 'color'
    addFilter 'Boulder', 'boulder_grade_id', 'Grade'
    addFilter 'TopRope', 'toprope_grade_id', 'Grade'
    addFilter 'Lead', 'lead_grade_id', 'Grade'
    addFilter 'Setter', 'setter'
    addFilter 'Rating', 'rating'
    addFilter 'Sends', 'sends'
    addFilter 'Date Set', 'date_value'

    getUniqueSet = (pData, pKey, pExtra) ->
      value = undefined
      set = undefined
      seen = undefined
      extra = undefined
      set = []
      seen = []
      i = 0
      while i < pData.length
        value = pData[i][pKey]
        if value != null
          if seen.indexOf(value) == -1
            extra = null
            if pExtra
              extra = pData[i][pExtra]
            set.push
              value: value
              key: pKey
              extra: extra
            seen.push value
        i += 1
      set

    sortByValue = (pArray) ->
      pArray.sort (a, b) ->
        a.value.localeCompare b.value
      return

    ###
        TODO: Convert from 'function' to var function
    ###

    refreshFilter = (pFilter) ->
      length = undefined
      key = undefined
      entry = undefined
      filter = undefined
      filter = String(pFilter.value)
      if filter.indexOf('Any') != -1
        return
      i = 0
      length = $scope.routes.length
      while i < length
        key = pFilter.key
        entry = $scope.routes[i]
        if entry[key] != pFilter.value
          entry.show = false
        i += 1
      return

    ###
        TODO: Convert from 'function' to var function
    ###

    showAllRoutes = ->
      length = undefined
      i = 0
      length = $scope.routes.length
      while i < length
        $scope.routes[i].show = true
        i += 1
      return

    processRoutes = (pData) ->
      clone = undefined
      $scope.isLoading = false
      if pData.length == 0
        return
      pData.map (pEntry) ->
        pEntry.date_format = DateFormatService.format(pEntry.date)
        pEntry.date_value = moment(pEntry.date).valueOf()
        pEntry.boulder_grade_id = pEntry.boulder_grade_id or -1
        pEntry.toprope_grade_id = pEntry.toprope_grade_id or -1
        pEntry.lead_grade_id = pEntry.lead_grade_id or -1
        if !pEntry.rating
          pEntry.rating = -1
        else
          pEntry.rating = parseInt(pEntry.rating, 10)
        pEntry.show = true
        pEntry
      # Creates the data needed by the select elements
      $scope.zoneInputs = getUniqueSet(pData, 'wall_name')
      $scope.colorInputs = getUniqueSet(pData, 'color', 'value')
      $scope.setterInputs = getUniqueSet(pData, 'setter')
      # Zone Option - prepend 'any zone'
      $scope.zoneInputs.sort NaturalSort
      clone = JSON.parse(JSON.stringify($scope.zoneInputs[0]))
      clone.value = 'Any'
      $scope.zoneInputs.unshift clone
      # Color Option - prepend 'any color'
      sortByValue $scope.colorInputs
      clone = JSON.parse(JSON.stringify($scope.colorInputs[0]))
      clone.value = 'Any'
      $scope.colorInputs.unshift clone
      # Setter Option - prepend 'any setter'
      sortByValue $scope.setterInputs
      clone = JSON.parse(JSON.stringify($scope.setterInputs[0]))
      clone.value = 'Any'
      $scope.setterInputs.unshift clone
      # Select the 'Any' be default
      $scope.form.zoneFilter = $scope.zoneInputs[0]
      $scope.form.colorFilter = $scope.colorInputs[0]
      $scope.form.setterFilter = $scope.setterInputs[0]
      $scope.routes = pData
      $scope.refreshFilters()
      $scope.$apply()
      return

    $scope.hasRoutes = ->
      $scope.routes.length > 0

    $scope.refreshFilters = ->
      `var i`
      i = undefined
      route = undefined
      showAllRoutes()
      refreshFilter $scope.form.view
      refreshFilter $scope.form.zoneFilter
      refreshFilter $scope.form.colorFilter
      if $scope.form.view.name == $scope.BOULDERING_VIEW
        $scope.form.boulderGrade.value = $scope.form.boulderGrade.name
        $scope.form.boulderGrade.key = 'boulder_grade'
        refreshFilter $scope.form.boulderGrade
      if $scope.form.view.name == $scope.TOPROPE_VIEW
        $scope.form.ropeGrade.value = $scope.form.ropeGrade.name
        $scope.form.ropeGrade.key = 'toprope_grade'
        refreshFilter $scope.form.ropeGrade
      if $scope.form.view.name == $scope.LEAD_VIEW
        $scope.form.ropeGrade.value = $scope.form.ropeGrade.name
        $scope.form.ropeGrade.key = 'lead_grade'
        refreshFilter $scope.form.ropeGrade
      refreshFilter $scope.form.setterFilter
      $scope.displayCount = $scope.DISPLAY_COUNT
      $scope.visibleRoutes = []
      while i < $scope.routes.length
        route = $scope.routes[i]
        if route.show
          $scope.visibleRoutes.push route
        i += 1
      $scope.isOneVisible = $scope.getVisibleRouteCount() > 0
      return

    $scope.refreshView = ->
      $scope.refreshFilters()
      return

    $scope.isFilled = (pStar, pRating) ->
      if pStar.rating <= pRating
        return true
      false

    $scope.hideHeader = (pFilter) ->
      filterName = undefined
      type = undefined
      filterName = pFilter.name
      type = $scope.form.view.name
      if filterName == 'Boulder'
        return type != $scope.BOULDERING_VIEW
      if filterName == 'TopRope'
        return type != $scope.TOPROPE_VIEW
      if filterName == 'Lead'
        return type != $scope.LEAD_VIEW
      return

    $scope.sortIconClicked = (pFilter) ->
      key = undefined
      temp = undefined
      $scope.filters.map (pEntry) ->
        if pEntry != pFilter
          pEntry.sort = 0
        pEntry
      pFilter.sort = (pFilter.sort + 1) % 3
      key = pFilter.key
      $scope.visibleRoutes.sort (a, b) ->
        if pFilter.sort == 2
          temp = a
          a = b
          b = temp
        if a[key].localeCompare
          return a[key].localeCompare(b[key])
        a[key] - (b[key])
      return

    boulderGradesPromise = GradesService.getBoulderGrades().success((pData) ->
      pData.unshift
        id: -1
        name: 'Any'
      $scope.boulderGradeInputs = pData
      $scope.form.boulderGrade = pData[0]
      return
    )
    ropeGradesPromise = GradesService.getRopeGrades().success((pData) ->
      pData.unshift
        id: -1
        name: 'Any'
      $scope.ropeGradeInputs = pData
      $scope.form.ropeGrade = pData[0]
      return
    )
    $q.all([
      boulderGradesPromise
      ropeGradesPromise
    ]).then ->
      RoutesService.getRoutesInGym $scope.gymId, (pData) ->
        $timeout (->
          processRoutes pData
          return
        ), 500
        return
      return
    return
]
