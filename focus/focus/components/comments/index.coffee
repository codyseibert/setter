module.exports = [
  '$rootScope'
  'RouteCommentService'
  (
    $rootScope
    RouteCommentService
  ) ->

    restrict: 'E'

    scope:
      model: '='

    link: (scope, elem, attr) ->

      RouteCommentService.find()
        .then (comments) ->
          scope.comments = (comments)

    templateUrl: 'components/comments/template.html'

]
