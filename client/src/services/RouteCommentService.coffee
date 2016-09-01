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
        $http.get "#{BASE_URL}/RouteComments", params: searchParams
          .then (RouteComments) ->
            resolve RouteComments.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteComments/#{id}"
          .then (RouteComment) ->
            resolve RouteComment.data
          .catch (err) ->
            reject (err)

    @create = (RouteComment) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteComments", RouteComment
          .then (RouteComment) ->
            resolve RouteComment.data
          .catch (err) ->
            reject (err)

    @update = (RouteComment) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteComments/" + RouteComment.id, RouteComment
          .then (RouteComment) ->
            resolve RouteComment.data
          .catch (err) ->
            reject (err)

    @delete = (RouteComment) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteComments/" + RouteComment.id
          .then (RouteComment) ->
            resolve RouteComment.data
          .catch (err) ->
            reject (err)

    return this
]
