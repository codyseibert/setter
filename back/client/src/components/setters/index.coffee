module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'SetterService'
  (
    $rootScope
    $state
    $stateParams
    SetterService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      SetterService.find gymId: $stateParams.gymId
        .then (setters) ->
          scope.setters = setters

      scope.submit = ->
        scope.form.gymId = $stateParams.gymId
        SetterService.create scope.form
          .then (setter) ->
            scope.setters.push setter

    templateUrl: 'components/setters/template.html'

]
