module.exports = [
  '$rootScope'
  '$state'
  '$stateParams'
  'ZoneService'
  'FileService'
  (
    $rootScope
    $state
    $stateParams
    ZoneService
    FileService
  ) ->

    restrict: 'E'

    link: (scope, elem, attr) ->

      ZoneService.get $stateParams.zoneId
        .then (zone) ->
          scope.zone = zone

      scope.upload = (file, key) ->
        FileService.upload file
          .then (data) ->
            scope.zone[key] = data
            ZoneService.update scope.zone

    templateUrl: 'components/preview/template.html'

]
