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
        $http.get "#{BASE_URL}/Zones", params: searchParams
          .then (Zones) ->
            resolve Zones.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Zones/#{id}"
          .then (Zone) ->
            resolve Zone.data
          .catch (err) ->
            reject (err)

    @create = (Zone) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Zones", Zone
          .then (Zone) ->
            resolve Zone.data
          .catch (err) ->
            reject (err)

    @update = (Zone) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Zones/" + Zone.id, Zone
          .then (Zone) ->
            resolve Zone.data
          .catch (err) ->
            reject (err)

    @delete = (Zone) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Zones/" + Zone.id
          .then (Zone) ->
            resolve Zone.data
          .catch (err) ->
            reject (err)

    return this
]
