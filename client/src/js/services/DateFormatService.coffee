###jslint nomen: true ###

###global angular: false, moment: false ###

angular.module('SETTER').factory 'DateFormatService', [ ->
  'use strict'
  {
    formatMonth: (pDateString) ->
      moment(pDateString).format 'MMM'
    format: (pDateString) ->
      moment(pDateString).format 'MMM Do YYYY'
    formatWithTime: (pDateString) ->
      moment(pDateString).format 'MMM Do YYYY hh:mm:ss'

  }
 ]
