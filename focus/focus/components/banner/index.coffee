module.exports = [
  '$rootScope'
  (
    $rootScope
  ) ->

    restrict: 'E'

    scope:
      model: '='

    link: (scope, elem, attr) ->
      

    templateUrl: 'components/banner/template.html'

]
