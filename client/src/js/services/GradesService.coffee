###jslint nomen: true ###

###global angular: false ###

angular.module('SETTER').factory 'GradesService', [
  '$http'
  'HttpStubService'
  ($http, HttpStubService) ->
    'use strict'
    boulderGrades = null
    ropeGrade = null
    {
      getBoulderGrades: ->
        stub = HttpStubService.createStub()
        if boulderGrades != null
          stub.deferred.resolve boulderGrades.slice(0)
        else
          $http(
            method: 'GET'
            url: 'api/grades/boulder').success (pData) ->
            boulderGrades = pData
            stub.deferred.resolve boulderGrades.slice(0)
            return
        stub.promise
      getRopeGrades: ->
        stub = HttpStubService.createStub()
        if ropeGrade != null
          stub.deferred.resolve ropeGrade.slice(0)
        else
          $http(
            method: 'GET'
            url: 'api/grades/rope').success (pData) ->
            ropeGrade = pData
            stub.deferred.resolve ropeGrade.slice(0)
            return
        stub.promise

    }
]
