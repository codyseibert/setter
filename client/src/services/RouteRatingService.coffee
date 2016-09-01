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
        $http.get "#{BASE_URL}/RouteRatings", params: searchParams
          .then (RouteRatings) ->
            resolve RouteRatings.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteRatings/#{id}"
          .then (RouteRating) ->
            resolve RouteRating.data
          .catch (err) ->
            reject (err)

    @create = (RouteRating) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteRatings", RouteRating
          .then (RouteRating) ->
            resolve RouteRating.data
          .catch (err) ->
            reject (err)

    @update = (RouteRating) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteRatings/" + RouteRating.id, RouteRating
          .then (RouteRating) ->
            resolve RouteRating.data
          .catch (err) ->
            reject (err)

    @delete = (RouteRating) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteRatings/" + RouteRating.id
          .then (RouteRating) ->
            resolve RouteRating.data
          .catch (err) ->
            reject (err)

    return this
]
