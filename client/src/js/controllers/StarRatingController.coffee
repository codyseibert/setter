###jslint nomen: true ###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'StarRatingController', [
  '$scope'
  ($scope) ->
    'use strict'
    $scope.stars = []
    i = undefined
    (->
      i = 0
      while i < 5
        $scope.stars.push rating: i + 0.5
        i += 1
      return
    )()

    $scope.isFilled = (pStar, pRoute) ->
      if pStar.rating <= pRoute.rating
        return true
      false

    return
]
