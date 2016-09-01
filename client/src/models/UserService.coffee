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
        $http.get "#{BASE_URL}/Users", params: searchParams
          .then (Users) ->
            resolve Users.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Users/#{id}"
          .then (User) ->
            resolve User.data
          .catch (err) ->
            reject (err)

    @create = (User) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Users", User
          .then (User) ->
            resolve User.data
          .catch (err) ->
            reject (err)

    @update = (User) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Users/" + User.id, User
          .then (User) ->
            resolve User.data
          .catch (err) ->
            reject (err)

    @delete = (User) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Users/" + User.id
          .then (User) ->
            resolve User.data
          .catch (err) ->
            reject (err)

    return this
]
