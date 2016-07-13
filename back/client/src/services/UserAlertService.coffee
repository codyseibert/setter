module.exports = [
  '$http'
  '$q'
  'BASE_URL'
  (
    $http
    $q
    BASE_URL
  ) ->

    @find = (searchParams) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/UserAlerts", params: searchParams
          .then (UserAlerts) ->
            resolve UserAlerts.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/UserAlerts/#{id}"
          .then (UserAlert) ->
            resolve UserAlert.data
          .catch (err) ->
            reject (err)

    @create = (UserAlert) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/UserAlerts", UserAlert
          .then (UserAlert) ->
            resolve UserAlert.data
          .catch (err) ->
            reject (err)

    @update = (UserAlert) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/UserAlerts/" + UserAlert.id, UserAlert
          .then (UserAlert) ->
            resolve UserAlert.data
          .catch (err) ->
            reject (err)

    @delete = (UserAlert) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/UserAlerts/" + UserAlert.id
          .then (UserAlert) ->
            resolve UserAlert.data
          .catch (err) ->
            reject (err)

    return this
]
