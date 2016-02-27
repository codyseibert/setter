
angular.module('SETTER').controller 'BoulderDistributionController', [
  '$scope'
  '$rootScope'
  '$routeParams'
  'RoutesService'
  'GradesService'
  ($scope, $rootScope, $routeParams, RoutesService, GradesService) ->
    'use strict'
    $scope.gymId = parseInt($routeParams.gymId, 10)
    $scope.hasBoulder = false

    $scope.getAccountId = ->
      $rootScope.getAccountId()

    GradesService.getBoulderGrades().success (pGrades) ->
      $scope.boulderGrades = pGrades
      RoutesService.getBoulderRouteDistribution $scope.gymId, (pData) ->
        i = undefined
        j = undefined
        k = undefined
        count = undefined
        grade = undefined
        gradeName = undefined
        gradeCount = undefined
        $scope.hasBoulder = pData.length > 0
        $scope.boulderRouteDistribution = pData
        $scope.boulderZoneKeys = []
        $scope.boulderZones = {}
        $scope.boulderCounts = {}
        # build up a lookup table for (zone, grade) -> count
        i = 0
        while i < pData.length
          count = pData[i]
          $scope.boulderZones[count.zone] = $scope.boulderZones[count.zone] or {}
                    j = 0
          while j < pGrades.length
            grade = pGrades[j]
            $scope.boulderZones[count.zone][grade.name] = 0
            j += 1
          i += 1
        i = 0
        while i < pData.length
          count = pData[i]
          $scope.boulderZones[count.zone][count.grade] = count.count
          i += 1
        # sort the keys using a natural sort algorithm
        for k of $scope.boulderZones
          `k = k`
          if $scope.boulderZones.hasOwnProperty(k)
            $scope.boulderZoneKeys.push k
            $scope.boulderCounts[k] = []
        $scope.boulderZoneKeys.sort naturalSort()
        for k of $scope.boulderZones
          `k = k`
          if $scope.boulderZones.hasOwnProperty(k)
            i = 0
            while i < $scope.boulderGrades.length
              gradeName = $scope.boulderGrades[i].name
              gradeCount = $scope.boulderZones[k][gradeName]
              $scope.boulderCounts[k].push gradeCount
              i += 1
        return
      return

    $scope.export = ->
      JsPDF = jsPDF
      doc = new JsPDF
      offsetX = 15
      offsetY = 15
      marginX = 13
      marginY = 9
      j = undefined
      i = undefined
      key = undefined
      counts = undefined
      k = undefined
      c = undefined
      count = undefined
      doc.setFontSize 10
      # Header
      doc.text offsetX, offsetY, 'Zone'
      j = 0
      while j < $scope.boulderGrades.length
        doc.text offsetX + marginX * (j + 1), offsetY, $scope.boulderGrades[j].name
        j += 1
      # Body
      i = 0
      while i < $scope.boulderZoneKeys.length
        if i % 2 == 1
          doc.setFillColor 225, 225, 225
          doc.rect offsetX, offsetY + marginY * (i + 1) - 5, 1000, marginY, 'F'
        key = $scope.boulderZoneKeys[i]
        counts = $scope.boulderZones[key]
        doc.text offsetX, offsetY + marginY * (i + 1), key
        c = 0
        for k of counts
          `k = k`
          if counts.hasOwnProperty(k)
            count = String(counts[k])
            doc.text offsetX + marginX * (c + 1), offsetY + marginY * (i + 1), count
            c += 1
        i += 1
      doc.save 'BoulderDistributionGraph.pdf'
      return

    return
]
