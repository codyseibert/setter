angular.module('SETTER').directive 'ssGraph', [
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
      templateUrl: 'templates/graphs/barGraph.tpl.html'
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
        options.axisY = labelInterpolationFnc: (value) ->
          Math.round value

        scope.createGraph = ->
          new (Chartist.Bar)(element.find('.ct-chart')[0], scope.graphData, options)
          $interval (->
            if element.find('.ct-chart')[0]
              element.find('.ct-chart')[0].__chartist__.update()
            return
          ), 200
          return

        return

    }
]
