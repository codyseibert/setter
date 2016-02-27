###global angular: false, btoa: false, console: false, Chart: false, moment: false, $: false ###

angular.module('SETTER').directive 'ssRouteList', [
  '$timeout'
  ($timeout) ->
    'use strict'
    {
      scope:
        'activeCategory': '='
        'category': '@'
      templateUrl: 'templates/directives/ssRouteList.tpl.html'
      replace: true
      restrict: 'E'
      controller: [
        '$scope'
        '$routeParams'
        '$rootScope'
        'SelectedRouteService'
        'GymsService'
        ($scope, $routeParams, $rootScope, SelectedRouteService, GymsService) ->
          gymId = parseInt($routeParams.gymId, 10)
          that = this
          MORE = 'View More +'
          HIDE = 'Hide Routes -'
          $scope.gymId = gymId
          $scope.accountId = $rootScope.getAccountId()
          $scope.step = 5
          $scope.initial = 10
          $scope.routes = []
          $scope.text = MORE
          $scope.hasData = false
          $scope.loading = true
          if $scope.category == 'best'
            $scope.template = 'templates/gym/panels/activity/sections/BestRatedRoutes.tpl.html'
            $scope.$watch 'activeCategory', ->
              $scope.limit = $scope.initial
              $scope.text = MORE
              switch $scope.activeCategory
                when 'boulder'
                  GymsService.getBestRatedBoulder(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
                when 'toprope'
                  GymsService.getBestRatedTopRope(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
                when 'lead'
                  GymsService.getBestRatedLead(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
              return
          else
            $scope.template = 'templates/gym/panels/activity/sections/LatestRoutes.tpl.html'
            $scope.$watch 'activeCategory', ->
              $scope.limit = $scope.initial
              $scope.text = MORE
              switch $scope.activeCategory
                when 'boulder'
                  GymsService.getNewestBoulder(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
                when 'toprope'
                  GymsService.getNewestTopRope(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
                when 'lead'
                  GymsService.getNewestLead(gymId).success (pData) ->
                    $scope.routes = pData
                    $scope.hasData = pData.length > 0
                    $scope.loading = false
                    return
              return

          @getCategory = ->
            $scope.category

          @getActiveCategory = ->
            $scope.activeCategory

          @incrementLimitReached = ->
            $scope.limit >= $scope.routes.length

          @refreshText = ->
            if that.incrementLimitReached()
              $scope.text = HIDE
            else
              $scope.text = MORE
            return

          $scope.hasLessThanLimit = ->
            $scope.routes.length <= $scope.initial

          $scope.openRouteModal = (route) ->
            $rootScope.openRouteModal route
            return

          $scope.placeholderClick = ->
            if $rootScope.getAccountId() == gymId
              $rootScope.navigateToWalls gymId
            else
              $rootScope.navigateToGymSuggestions gymId
            return

          return
      ]
      link: (scope, element, attrs, ctrl) ->

        scope.clicked = ->
          if !ctrl.incrementLimitReached()
            scope.loadingMore = true
            $timeout (->
              scope.limit += scope.step
              scope.loadingMore = false
              ctrl.refreshText()
              return
            ), 200
          else
            scope.limit = scope.initial
            ctrl.refreshText()
          return

        #TO:DO Separate this function from the route list
        #by using ss-placeholder directive
        scope.$watch 'activeCategory', ->
          if scope.activeCategory
            scope.placeholderImage = 'images/placeholder--' + scope.category + scope.activeCategory.replace(' ', '') + '.jpg'
          if scope.accountId == scope.gymId
            scope.placeholderTitle = 'Oops! These aren\'t your ' + scope.activeCategory + ' routes.'
            scope.placeholderText = 'There aren\'t any here right now, but you can set new ones on the'
            scope.placeholderLinkTest = ' Manage Zones page'
          else
            scope.placeholderTitle = 'Bummer, this gym has no ' + scope.activeCategory + ' yet.'
            scope.placeholderText = 'If you\'d like to climb some, let them know over at their'
            scope.placeholderLinkTest = ' Suggestions board.'
          return
        return

    }
]
