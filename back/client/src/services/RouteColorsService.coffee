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
        $http.get "#{BASE_URL}/RouteColorss", params: searchParams
          .then (RouteColorss) ->
            resolve RouteColorss.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteColorss/#{id}"
          .then (RouteColors) ->
            resolve RouteColors.data
          .catch (err) ->
            reject (err)

    @create = (RouteColors) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteColorss", RouteColors
          .then (RouteColors) ->
            resolve RouteColors.data
          .catch (err) ->
            reject (err)

    @update = (RouteColors) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteColorss/" + RouteColors.id, RouteColors
          .then (RouteColors) ->
            resolve RouteColors.data
          .catch (err) ->
            reject (err)

    @delete = (RouteColors) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteColorss/" + RouteColors.id
          .then (RouteColors) ->
            resolve RouteColors.data
          .catch (err) ->
            reject (err)

    return this
]
