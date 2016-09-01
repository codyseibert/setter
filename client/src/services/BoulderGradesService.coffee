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
        $http.get "#{BASE_URL}/BoulderGradess", params: searchParams
          .then (BoulderGradess) ->
            resolve BoulderGradess.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/BoulderGradess/#{id}"
          .then (BoulderGrades) ->
            resolve BoulderGrades.data
          .catch (err) ->
            reject (err)

    @create = (BoulderGrades) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/BoulderGradess", BoulderGrades
          .then (BoulderGrades) ->
            resolve BoulderGrades.data
          .catch (err) ->
            reject (err)

    @update = (BoulderGrades) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/BoulderGradess/" + BoulderGrades.id, BoulderGrades
          .then (BoulderGrades) ->
            resolve BoulderGrades.data
          .catch (err) ->
            reject (err)

    @delete = (BoulderGrades) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/BoulderGradess/" + BoulderGrades.id
          .then (BoulderGrades) ->
            resolve BoulderGrades.data
          .catch (err) ->
            reject (err)

    return this
]
