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
        $http.get "#{BASE_URL}/Suggestions", params: searchParams
          .then (Suggestions) ->
            resolve Suggestions.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Suggestions/#{id}"
          .then (Suggestion) ->
            resolve Suggestion.data
          .catch (err) ->
            reject (err)

    @create = (Suggestion) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Suggestions", Suggestion
          .then (Suggestion) ->
            resolve Suggestion.data
          .catch (err) ->
            reject (err)

    @update = (Suggestion) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Suggestions/" + Suggestion.id, Suggestion
          .then (Suggestion) ->
            resolve Suggestion.data
          .catch (err) ->
            reject (err)

    @delete = (Suggestion) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Suggestions/" + Suggestion.id
          .then (Suggestion) ->
            resolve Suggestion.data
          .catch (err) ->
            reject (err)

    return this
]
