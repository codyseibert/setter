###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'SelectedRouteService', [ ->
  'use strict'
  selectedRoute = null
  {
    offCanvasModalShown: false
    setSelectedRoute: (route) ->
      selectedRoute = route
      return
    getSelectedRoute: ->
      selectedRoute
    toggleModal: ->
      @offCanvasModalShown = !@offCanvasModalShown
      return
    hideModal: ->
      @offCanvasModalShown = false
      return

  }
 ]
