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
        $http.get "#{BASE_URL}/RouteNewToUsers", params: searchParams
          .then (RouteNewToUsers) ->
            resolve RouteNewToUsers.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteNewToUsers/#{id}"
          .then (RouteNewToUser) ->
            resolve RouteNewToUser.data
          .catch (err) ->
            reject (err)

    @create = (RouteNewToUser) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteNewToUsers", RouteNewToUser
          .then (RouteNewToUser) ->
            resolve RouteNewToUser.data
          .catch (err) ->
            reject (err)

    @update = (RouteNewToUser) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteNewToUsers/" + RouteNewToUser.id, RouteNewToUser
          .then (RouteNewToUser) ->
            resolve RouteNewToUser.data
          .catch (err) ->
            reject (err)

    @delete = (RouteNewToUser) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteNewToUsers/" + RouteNewToUser.id
          .then (RouteNewToUser) ->
            resolve RouteNewToUser.data
          .catch (err) ->
            reject (err)

    return this
]
