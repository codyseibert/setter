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
        $http.get "#{BASE_URL}/Setters", params: searchParams
          .then (Setters) ->
            resolve Setters.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Setters/#{id}"
          .then (Setter) ->
            resolve Setter.data
          .catch (err) ->
            reject (err)

    @create = (Setter) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Setters", Setter
          .then (Setter) ->
            resolve Setter.data
          .catch (err) ->
            reject (err)

    @update = (Setter) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Setters/" + Setter.id, Setter
          .then (Setter) ->
            resolve Setter.data
          .catch (err) ->
            reject (err)

    @delete = (Setter) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Setters/" + Setter.id
          .then (Setter) ->
            resolve Setter.data
          .catch (err) ->
            reject (err)

    return this
]
