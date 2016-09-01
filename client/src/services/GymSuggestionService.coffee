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
        $http.get "#{BASE_URL}/GymSuggestions", params: searchParams
          .then (GymSuggestions) ->
            resolve GymSuggestions.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/GymSuggestions/#{id}"
          .then (GymSuggestion) ->
            resolve GymSuggestion.data
          .catch (err) ->
            reject (err)

    @create = (GymSuggestion) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/GymSuggestions", GymSuggestion
          .then (GymSuggestion) ->
            resolve GymSuggestion.data
          .catch (err) ->
            reject (err)

    @update = (GymSuggestion) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/GymSuggestions/" + GymSuggestion.id, GymSuggestion
          .then (GymSuggestion) ->
            resolve GymSuggestion.data
          .catch (err) ->
            reject (err)

    @delete = (GymSuggestion) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/GymSuggestions/" + GymSuggestion.id
          .then (GymSuggestion) ->
            resolve GymSuggestion.data
          .catch (err) ->
            reject (err)

    return this
]
