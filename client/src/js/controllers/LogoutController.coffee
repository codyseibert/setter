###jslint nomen: true ###

###jslint unparam: true###

###global angular: false, btoa: false, console: false ###

angular.module('SETTER').controller 'LogoutController', [
  '$scope'
  '$location'
  'LoginService'
  ($scope, $location, LoginService) ->
    'use strict'
    LoginService.logout()
    return
]
