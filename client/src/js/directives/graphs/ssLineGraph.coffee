angular.module('SETTER').directive 'ssLineGraph', [
  '$timeout'
  '$interval'
  ($timeout, $interval) ->
    'use strict'
    {
      restrict: 'E'
      replace: true
      scope:
        graphData: '='
        type: '@'
      templateUrl: 'templates/graphs/lineGraph.tpl.html'
      controller: [
        '$scope'
        ($scope) ->
          $scope.noData = true

          $scope.render = ->
            $timeout ->
              $scope.createGraph()
              $scope.loading = false
              return
            return

          $scope.$watch 'graphData', ->
            $scope.loading = true
            #Prevents graph from loading even with zero values
            if $scope.graphData == undefined
              return
            else if $scope.graphData.labels.length == 0
              $scope.noData = true
              $scope.loading = false
            else
              $scope.loading = true
              $scope.noData = false
              $scope.render()
            return
          return
      ]
      link: (scope, element, attrs) ->
        scope.noData = true
        options = {}
        options.height = '300px'
        if scope.type == 'bouldering'
          options.low = 0
          options.high = 10
        else
          options.low = 7
          options.high = 14
        options.axisY = labelInterpolationFnc: (value) ->
          if scope.type == 'bouldering'
            'V' + Math.round(value)
          else
            '5.' + Math.round(value)

        scope.createGraph = ->
          new (Chartist.Line)(element.find('.ct-chart')[0], scope.graphData, options)
          $interval (->
            if element.find('.ct-chart')[0]
              element.find('.ct-chart')[0].__chartist__.update()
            return
          ), 200
          return

        return

    }
]
