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
        $http.get "#{BASE_URL}/GymAlerts", params: searchParams
          .then (GymAlerts) ->
            resolve GymAlerts.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/GymAlerts/#{id}"
          .then (GymAlert) ->
            resolve GymAlert.data
          .catch (err) ->
            reject (err)

    @create = (GymAlert) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/GymAlerts", GymAlert
          .then (GymAlert) ->
            resolve GymAlert.data
          .catch (err) ->
            reject (err)

    @update = (GymAlert) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/GymAlerts/" + GymAlert.id, GymAlert
          .then (GymAlert) ->
            resolve GymAlert.data
          .catch (err) ->
            reject (err)

    @delete = (GymAlert) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/GymAlerts/" + GymAlert.id
          .then (GymAlert) ->
            resolve GymAlert.data
          .catch (err) ->
            reject (err)

    return this
]
