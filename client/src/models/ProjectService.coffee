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
        $http.get "#{BASE_URL}/Projects", params: searchParams
          .then (Projects) ->
            resolve Projects.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Projects/#{id}"
          .then (Project) ->
            resolve Project.data
          .catch (err) ->
            reject (err)

    @create = (Project) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Projects", Project
          .then (Project) ->
            resolve Project.data
          .catch (err) ->
            reject (err)

    @update = (Project) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Projects/" + Project.id, Project
          .then (Project) ->
            resolve Project.data
          .catch (err) ->
            reject (err)

    @delete = (Project) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Projects/" + Project.id
          .then (Project) ->
            resolve Project.data
          .catch (err) ->
            reject (err)

    return this
]
