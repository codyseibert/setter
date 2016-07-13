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
        $http.get "#{BASE_URL}/Feedbacks", params: searchParams
          .then (Feedbacks) ->
            resolve Feedbacks.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Feedbacks/#{id}"
          .then (Feedback) ->
            resolve Feedback.data
          .catch (err) ->
            reject (err)

    @create = (Feedback) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Feedbacks", Feedback
          .then (Feedback) ->
            resolve Feedback.data
          .catch (err) ->
            reject (err)

    @update = (Feedback) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Feedbacks/" + Feedback.id, Feedback
          .then (Feedback) ->
            resolve Feedback.data
          .catch (err) ->
            reject (err)

    @delete = (Feedback) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Feedbacks/" + Feedback.id
          .then (Feedback) ->
            resolve Feedback.data
          .catch (err) ->
            reject (err)

    return this
]
