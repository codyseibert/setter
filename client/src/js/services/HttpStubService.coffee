###jslint nomen: true ###

###global angular: false, btoa: false, console: false, alert: false, Chart: false, confirm: false, jsPDF: false, naturalSort: false ###

angular.module('SETTER').factory 'HttpStubService', [
  '$q'
  ($q) ->
    'use strict'
    { createStub: ->
      deferred = $q.defer()
      promise = deferred.promise

      promise.success = (fn) ->
        promise.then fn
        promise

      promise.error = (fn) ->
        promise.then null, fn
        promise

      {
        promise: promise
        deferred: deferred
      }
 }
]
