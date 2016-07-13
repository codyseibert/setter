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
        $http.get "#{BASE_URL}/SuggestionVotess", params: searchParams
          .then (SuggestionVotess) ->
            resolve SuggestionVotess.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/SuggestionVotess/#{id}"
          .then (SuggestionVotes) ->
            resolve SuggestionVotes.data
          .catch (err) ->
            reject (err)

    @create = (SuggestionVotes) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/SuggestionVotess", SuggestionVotes
          .then (SuggestionVotes) ->
            resolve SuggestionVotes.data
          .catch (err) ->
            reject (err)

    @update = (SuggestionVotes) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/SuggestionVotess/" + SuggestionVotes.id, SuggestionVotes
          .then (SuggestionVotes) ->
            resolve SuggestionVotes.data
          .catch (err) ->
            reject (err)

    @delete = (SuggestionVotes) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/SuggestionVotess/" + SuggestionVotes.id
          .then (SuggestionVotes) ->
            resolve SuggestionVotes.data
          .catch (err) ->
            reject (err)

    return this
]
