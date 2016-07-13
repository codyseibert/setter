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
        $http.get "#{BASE_URL}/RopeGradess", params: searchParams
          .then (RopeGradess) ->
            resolve RopeGradess.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/RopeGradess/#{id}"
          .then (RopeGrades) ->
            resolve RopeGrades.data
          .catch (err) ->
            reject (err)

    @create = (RopeGrades) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/RopeGradess", RopeGrades
          .then (RopeGrades) ->
            resolve RopeGrades.data
          .catch (err) ->
            reject (err)

    @update = (RopeGrades) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/RopeGradess/" + RopeGrades.id, RopeGrades
          .then (RopeGrades) ->
            resolve RopeGrades.data
          .catch (err) ->
            reject (err)

    @delete = (RopeGrades) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/RopeGradess/" + RopeGrades.id
          .then (RopeGrades) ->
            resolve RopeGrades.data
          .catch (err) ->
            reject (err)

    return this
]
