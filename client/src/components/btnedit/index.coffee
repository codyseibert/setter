module.exports = [
  '$rootScope'
  (
    $rootScope
  ) ->

    restrict: 'E'

    scope:
      save: '&'
      delete: '&'
      editing: '='

    link: (scope, elem, attr) ->

      scope.edit = ->
        scope.editing = !scope.editing

      scope.cancel = ->
        scope.editing = false

      scope.preSave = ->
        scope.editing = false
        scope.save()

    templateUrl: 'components/btnedit/template.html'

]
