module.exports = [
  '$http'
  '$q'
  'BASE_URL'
  'jwtHelper'
  'localStorageService'
  (
    $http
    $q
    BASE_URL
    jwtHelper
    localStorageService
  ) ->

    @token = localStorageService.get 'token'
    @user = localStorageService.get 'user'

    @login = (email, password) =>
      $q (resolve, reject) =>
        $http.post "#{BASE_URL}/Login",
          email: email
          password: password
        .then (jwt) =>
          @user = jwtHelper.decodeToken jwt.data
          @token = jwt.data
          localStorageService.set 'token', @token
          localStorageService.set 'user', @user
          resolve()
        .catch (err) ->
          reject (err)

    @logout = ->
      @user = null
      @token = null
      localStorageService.remove 'token'
      localStorageService.remove 'user'

    return this
]
