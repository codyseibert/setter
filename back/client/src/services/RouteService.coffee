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
        $http.get "#{BASE_URL}/Routes", params: searchParams
          .then (Routes) ->
            resolve Routes.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Routes/#{id}"
          .then (Route) ->
            resolve Route.data
          .catch (err) ->
            reject (err)

    @create = (Route) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Routes", Route
          .then (Route) ->
            resolve Route.data
          .catch (err) ->
            reject (err)

    @update = (Route) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Routes/" + Route.id, Route
          .then (Route) ->
            resolve Route.data
          .catch (err) ->
            reject (err)

    @delete = (Route) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Routes/" + Route.id
          .then (Route) ->
            resolve Route.data
          .catch (err) ->
            reject (err)

    return this
]
