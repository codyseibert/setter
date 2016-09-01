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
        $http.get "#{BASE_URL}/Comments", params: searchParams
          .then (Comments) ->
            resolve Comments.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Comments/#{id}"
          .then (Comment) ->
            resolve Comment.data
          .catch (err) ->
            reject (err)

    @create = (Comment) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Comments", Comment
          .then (Comment) ->
            resolve Comment.data
          .catch (err) ->
            reject (err)

    @update = (Comment) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Comments/" + Comment.id, Comment
          .then (Comment) ->
            resolve Comment.data
          .catch (err) ->
            reject (err)

    @delete = (Comment) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Comments/" + Comment.id
          .then (Comment) ->
            resolve Comment.data
          .catch (err) ->
            reject (err)

    return this
]
