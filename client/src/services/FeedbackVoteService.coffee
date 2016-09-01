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
        $http.get "#{BASE_URL}/FeedbackVotes", params: searchParams
          .then (FeedbackVotes) ->
            resolve FeedbackVotes.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/FeedbackVotes/#{id}"
          .then (FeedbackVote) ->
            resolve FeedbackVote.data
          .catch (err) ->
            reject (err)

    @create = (FeedbackVote) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/FeedbackVotes", FeedbackVote
          .then (FeedbackVote) ->
            resolve FeedbackVote.data
          .catch (err) ->
            reject (err)

    @update = (FeedbackVote) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/FeedbackVotes/" + FeedbackVote.id, FeedbackVote
          .then (FeedbackVote) ->
            resolve FeedbackVote.data
          .catch (err) ->
            reject (err)

    @delete = (FeedbackVote) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/FeedbackVotes/" + FeedbackVote.id
          .then (FeedbackVote) ->
            resolve FeedbackVote.data
          .catch (err) ->
            reject (err)

    return this
]
