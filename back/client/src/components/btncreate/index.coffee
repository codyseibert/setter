module.exports = [
  '$rootScope'
  (
    $rootScope
  ) ->

    restrict: 'E'

    scope:
      save: '='
      creating: '='

    link: (scope, elem, attr) ->

      scope.create = ->
        scope.creating = !scope.creating

      scope.cancel = ->
        scope.creating = false

      scope.preSave = ->
        scope.creating = false
        scope.save()

    templateUrl: 'components/btncreate/template.html'

]
