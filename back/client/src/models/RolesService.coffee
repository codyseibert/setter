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
        $http.get "#{BASE_URL}/Roless", params: searchParams
          .then (Roless) ->
            resolve Roless.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Roless/#{id}"
          .then (Roles) ->
            resolve Roles.data
          .catch (err) ->
            reject (err)

    @create = (Roles) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Roless", Roles
          .then (Roles) ->
            resolve Roles.data
          .catch (err) ->
            reject (err)

    @update = (Roles) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Roless/" + Roles.id, Roles
          .then (Roles) ->
            resolve Roles.data
          .catch (err) ->
            reject (err)

    @delete = (Roles) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Roless/" + Roles.id
          .then (Roles) ->
            resolve Roles.data
          .catch (err) ->
            reject (err)

    return this
]
