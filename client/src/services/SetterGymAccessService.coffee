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
        $http.get "#{BASE_URL}/SetterGymAccesss", params: searchParams
          .then (SetterGymAccesss) ->
            resolve SetterGymAccesss.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/SetterGymAccesss/#{id}"
          .then (SetterGymAccess) ->
            resolve SetterGymAccess.data
          .catch (err) ->
            reject (err)

    @create = (SetterGymAccess) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/SetterGymAccesss", SetterGymAccess
          .then (SetterGymAccess) ->
            resolve SetterGymAccess.data
          .catch (err) ->
            reject (err)

    @update = (SetterGymAccess) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/SetterGymAccesss/" + SetterGymAccess.id, SetterGymAccess
          .then (SetterGymAccess) ->
            resolve SetterGymAccess.data
          .catch (err) ->
            reject (err)

    @delete = (SetterGymAccess) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/SetterGymAccesss/" + SetterGymAccess.id
          .then (SetterGymAccess) ->
            resolve SetterGymAccess.data
          .catch (err) ->
            reject (err)

    return this
]
