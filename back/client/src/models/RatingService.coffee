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
        $http.get "#{BASE_URL}/Ratings", params: searchParams
          .then (Ratings) ->
            resolve Ratings.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Ratings/#{id}"
          .then (Rating) ->
            resolve Rating.data
          .catch (err) ->
            reject (err)

    @create = (Rating) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Ratings", Rating
          .then (Rating) ->
            resolve Rating.data
          .catch (err) ->
            reject (err)

    @update = (Rating) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Ratings/" + Rating.id, Rating
          .then (Rating) ->
            resolve Rating.data
          .catch (err) ->
            reject (err)

    @delete = (Rating) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Ratings/" + Rating.id
          .then (Rating) ->
            resolve Rating.data
          .catch (err) ->
            reject (err)

    return this
]
