###Rating Directive###

angular.module('SETTER').directive 'starRating', ->
  {
    restrict: 'A'
    scope: rating: '='
    replace: true
    templateUrl: 'templates/StarRating.tpl.html'
    controller: 'StarRatingController'
    link: (scope, element, attrs) ->

  }
