angular.module('SETTER').directive 'ssBackButton', [
  '$rootScope'
  '$routeParams'
  ($rootScope, $routeParams) ->
    'use strict'
    {
      restrict: 'E'
      replace: true
      templateUrl: 'templates/directives/ssBackButton.tpl.html'
      link: (scope, element, attrs) ->
        scope.backButtonActive = false

        scope.applyIsShowing = ->
          element.removeClass 'is-hidden'
          element.addClass 'is-showing'
          element.siblings('.nav-menuIcon').removeClass 'is-showing'
          element.siblings('.nav-menuIcon').addClass 'is-hidden'
          return

        scope.applyIsHidden = ->
          element.removeClass 'is-showing'
          element.addClass 'is-hidden'
          element.siblings('.nav-menuIcon').addClass 'is-showing'
          element.siblings('.nav-menuIcon').removeClass 'is-hidden'
          return

        $rootScope.$on '$routeChangeSuccess', ->
          #This checks for all types of pages to the deliver the back button or not
          if $rootScope.currentPageIsZones() or $rootScope.currentPageIsZone() or $rootScope.currentPageIsUser() and $rootScope.isGymAccount() or $rootScope.isUserAccount and $rootScope.currentPageIsUser() and $rootScope.currentPageIsOtherUser($routeParams.userId)
            scope.backButtonActive = true
            scope.applyIsShowing()
          else if $rootScope.currentPageIsGyms()
            scope.backButtonActive = false
            scope.applyIsHidden()
          else
            scope.backButtonActive = false
            scope.applyIsHidden()
          return
        return

    }
]
