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
        $http.get "#{BASE_URL}/Discussions", params: searchParams
          .then (discussions) ->
            resolve discussions.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Discussions/#{id}"
          .then (discussion) ->
            resolve discussion.data
          .catch (err) ->
            reject (err)

    @create = (discussion) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Discussions", discussion
          .then (discussion) ->
            resolve discussion.data
          .catch (err) ->
            reject (err)

    @update = (discussion) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Discussions/" + discussion.id, discussion
          .then (discussion) ->
            resolve discussion.data
          .catch (err) ->
            reject (err)

    @delete = (discussion) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Discussions/" + discussion.id
          .then (discussion) ->
            resolve discussion.data
          .catch (err) ->
            reject (err)

    return this
]
