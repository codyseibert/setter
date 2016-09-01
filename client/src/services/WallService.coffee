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
        $http.get "#{BASE_URL}/Walls", params: searchParams
          .then (Walls) ->
            resolve Walls.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Walls/#{id}"
          .then (Wall) ->
            resolve Wall.data
          .catch (err) ->
            reject (err)

    @create = (Wall) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Walls", Wall
          .then (Wall) ->
            resolve Wall.data
          .catch (err) ->
            reject (err)

    @update = (Wall) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Walls/" + Wall.id, Wall
          .then (Wall) ->
            resolve Wall.data
          .catch (err) ->
            reject (err)

    @delete = (Wall) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Walls/" + Wall.id
          .then (Wall) ->
            resolve Wall.data
          .catch (err) ->
            reject (err)

    return this
]
