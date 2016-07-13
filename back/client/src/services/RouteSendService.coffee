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
        $http.get "#{BASE_URL}/RouteSends", params: searchParams
          .then (RouteSends) ->
            resolve RouteSends.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteSends/#{id}"
          .then (RouteSend) ->
            resolve RouteSend.data
          .catch (err) ->
            reject (err)

    @create = (RouteSend) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteSends", RouteSend
          .then (RouteSend) ->
            resolve RouteSend.data
          .catch (err) ->
            reject (err)

    @update = (RouteSend) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteSends/" + RouteSend.id, RouteSend
          .then (RouteSend) ->
            resolve RouteSend.data
          .catch (err) ->
            reject (err)

    @delete = (RouteSend) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteSends/" + RouteSend.id
          .then (RouteSend) ->
            resolve RouteSend.data
          .catch (err) ->
            reject (err)

    return this
]
