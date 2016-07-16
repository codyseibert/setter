module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'SetterService'
  'User'
  (
    $rootScope
    $state
    $stateParams
    SetterService
    User
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->

      scope.creating = false
      scope.form = {}

      SetterService.find gymId: User.gymId
        .then (setters) ->
          scope.setters = setters
          scope.setters.forEach (setter) ->
            setter.image = 'assets/images/me.jpeg'

      scope.submit = ->
        scope.creating = false
        scope.form.gymId = User.gymId
        SetterService.create scope.form
          .then (setter) ->
            scope.setters.push setter

      scope.new = ->
        scope.creating = !scope.creating

      scope.cancel = ->
        scope.creating = false

      # scope.delete = (entry) ->
      #   isYes = confirm 'Are you sure you want to delete this news entry?'
      #   scope.entries.splice scope.entries.indexOf(entry), 1 if isYes

    templateUrl: 'components/setters/template.html'

]
