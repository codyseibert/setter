module.exports = [
  '$rootScope'
  'lodash'
  'GymService'
  'FileService'
  (
    $rootScope
    _
    GymService
    FileService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->
      GymService.get 2
        .then (gym) ->
          scope.gym = gym
          scope.gym.hideSetters = !!gym.hideSetters

      scope.submit = ->
        GymService.update scope.gym
          .then (gym) ->

      scope.upload = (file, key) ->
        FileService.upload file
          .then (data) ->
            scope.gym[key] = data

    templateUrl: 'components/configurations/template.html'

]
