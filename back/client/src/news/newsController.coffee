module.exports = [
  '$scope'
  (
    $scope
  ) ->

    $scope.creating = false

    $scope.entries = [
      text: 'the gym will be close sunday'
      date: 'January 12th, 2016'
    ,
      text: 'the gym will be close sunday'
      date: 'January 12th, 2016'
    ,
      text: 'the gym will be close sunday'
      date: 'January 12th, 2016'
    ]

    $scope.createNews = ->
      $scope.creating = !$scope.creating

    $scope.cancel = ->
      $scope.creating = false

    $scope.edit = (entry) ->
      entry.editing = true

    $scope.cancelEntry = (entry) ->
      entry.editing = false

    $scope.save = (entry) ->
      entry.editing = false

    $scope.delete = (entry) ->
      isYes = confirm 'Are you sure you want to delete this news entry?'
      $scope.entries.splice $scope.entries.indexOf(entry), 1 if isYes
]
