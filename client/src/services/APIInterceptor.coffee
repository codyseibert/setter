module.exports = [
  '$injector'
  (
    $injector
  ) ->

    request: (config) ->
      LoginService = $injector.get 'LoginService'
      token = LoginService.token
      config.headers['Authorization'] = token if token?
      config

]
