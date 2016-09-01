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
        $http.get "#{BASE_URL}/Alerts", params: searchParams
          .then (Alerts) ->
            resolve Alerts.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Alerts/#{id}"
          .then (Alert) ->
            resolve Alert.data
          .catch (err) ->
            reject (err)

    @create = (Alert) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Alerts", Alert
          .then (Alert) ->
            resolve Alert.data
          .catch (err) ->
            reject (err)

    @update = (Alert) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Alerts/" + Alert.id, Alert
          .then (Alert) ->
            resolve Alert.data
          .catch (err) ->
            reject (err)

    @delete = (Alert) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Alerts/" + Alert.id
          .then (Alert) ->
            resolve Alert.data
          .catch (err) ->
            reject (err)

    return this
]
