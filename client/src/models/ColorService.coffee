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
        $http.get "#{BASE_URL}/Colors", params: searchParams
          .then (Colors) ->
            resolve Colors.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Colors/#{id}"
          .then (Color) ->
            resolve Color.data
          .catch (err) ->
            reject (err)

    @create = (Color) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Colors", Color
          .then (Color) ->
            resolve Color.data
          .catch (err) ->
            reject (err)

    @update = (Color) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Colors/" + Color.id, Color
          .then (Color) ->
            resolve Color.data
          .catch (err) ->
            reject (err)

    @delete = (Color) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Colors/" + Color.id
          .then (Color) ->
            resolve Color.data
          .catch (err) ->
            reject (err)

    return this
]
