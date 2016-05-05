module.exports = [
  '$rootScope'
  'RouteSendService'
  (
    $rootScope
    RouteSendService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      RouteSendService.find()
        .then (sends) ->
          scope.sends = sends

    templateUrl: 'components/sends/template.html'

]
