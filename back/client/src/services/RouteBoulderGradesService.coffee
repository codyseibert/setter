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
        $http.get "#{BASE_URL}/RouteBoulderGradess", params: searchParams
          .then (RouteBoulderGradess) ->
            resolve RouteBoulderGradess.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RouteBoulderGradess/#{id}"
          .then (RouteBoulderGrades) ->
            resolve RouteBoulderGrades.data
          .catch (err) ->
            reject (err)

    @create = (RouteBoulderGrades) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RouteBoulderGradess", RouteBoulderGrades
          .then (RouteBoulderGrades) ->
            resolve RouteBoulderGrades.data
          .catch (err) ->
            reject (err)

    @update = (RouteBoulderGrades) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RouteBoulderGradess/" + RouteBoulderGrades.id, RouteBoulderGrades
          .then (RouteBoulderGrades) ->
            resolve RouteBoulderGrades.data
          .catch (err) ->
            reject (err)

    @delete = (RouteBoulderGrades) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RouteBoulderGradess/" + RouteBoulderGrades.id
          .then (RouteBoulderGrades) ->
            resolve RouteBoulderGrades.data
          .catch (err) ->
            reject (err)

    return this
]
