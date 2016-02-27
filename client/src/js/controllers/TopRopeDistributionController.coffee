###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, $: false, naturalSort: false, jsPDF: false ###

angular.module('SETTER').controller 'TopRopeDistributionController', [
  '$scope'
  '$rootScope'
  '$routeParams'
  'RoutesService'
  'GradesService'
  ($scope, $rootScope, $routeParams, RoutesService, GradesService) ->
    'use strict'
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.hasTopRope = false

    $scope.getAccountId = ->
      $rootScope.getAccountId()

    GradesService.getRopeGrades().success (pGrades) ->
      $scope.ropeGrades = pGrades
      RoutesService.getTopRopeRouteDistribution $scope.gymId, (pData) ->
        i = undefined
        j = undefined
        k = undefined
        count = undefined
        grade = undefined
        gradeName = undefined
        gradeCount = undefined
        $scope.ropeRouteDistribution = pData
        $scope.ropeZoneKeys = []
        $scope.ropeZones = {}
        $scope.ropeCounts = {}
        $scope.hasTopRope = pData.length > 0
        # build up a lookup table for (zone, grade) -> count
        i = 0
        while i < pData.length
          count = pData[i]
          $scope.ropeZones[count.zone] = $scope.ropeZones[count.zone] or {}
                    j = 0
          while j < pGrades.length
            grade = pGrades[j]
            $scope.ropeZones[count.zone][grade.name] = 0
            j += 1
          i += 1
        i = 0
        while i < pData.length
          count = pData[i]
          $scope.ropeZones[count.zone][count.grade] = count.count
          i += 1
        # sort the keys using a natural sort algorithm
        for k of $scope.ropeZones
          `k = k`
          if $scope.ropeZones.hasOwnProperty(k)
            $scope.ropeZoneKeys.push k
            $scope.ropeCounts[k] = []
        $scope.ropeZoneKeys.sort naturalSort()
        for k of $scope.ropeZones
          `k = k`
          if $scope.ropeZones.hasOwnProperty(k)
            i = 0
            while i < $scope.ropeGrades.length
              gradeName = $scope.ropeGrades[i].name
              gradeCount = $scope.ropeZones[k][gradeName]
              $scope.ropeCounts[k].push gradeCount
              i += 1
        return
      return
    # TODO: Refactor

    $scope.export = ->
      JsPDF = jsPDF
      doc = new JsPDF
      offsetX = 15
      offsetY = 15
      marginX = 13
      marginY = 9
      j = undefined
      i = undefined
      k = undefined
      key = undefined
      counts = undefined
      count = undefined
      c = undefined
      doc.setFontSize 10
      # Header
      doc.text offsetX, offsetY, 'Zone'
      j = 0
      while j < $scope.ropeGrades.length
        doc.text offsetX + marginX * (j + 1), offsetY, $scope.ropeGrades[j].name
        j += 1
      # Body
      i = 0
      while i < $scope.ropeZoneKeys.length
        if i % 2 == 1
          doc.setFillColor 225, 225, 225
          doc.rect offsetX, offsetY + marginY * (i + 1) - 5, 1000, marginY, 'F'
        key = $scope.ropeZoneKeys[i]
        counts = $scope.ropeZones[key]
        doc.text offsetX, offsetY + marginY * (i + 1), key
        c = 0
        for k of counts
          `k = k`
          if counts.hasOwnProperty(k)
            count = String(counts[k])
            doc.text offsetX + marginX * (c + 1), offsetY + marginY * (i + 1), count
            c += 1
        i += 1
      doc.save 'RopeDistributionGraph.pdf'
      return

    return
]
