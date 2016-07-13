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
        $http.get "#{BASE_URL}/Gyms", params: searchParams
          .then (Gyms) ->
            resolve Gyms.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Gyms/#{id}"
          .then (Gym) ->
            resolve Gym.data
          .catch (err) ->
            reject (err)

    @create = (Gym) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Gyms", Gym
          .then (Gym) ->
            resolve Gym.data
          .catch (err) ->
            reject (err)

    @update = (Gym) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Gyms/" + Gym.id, Gym
          .then (Gym) ->
            resolve Gym.data
          .catch (err) ->
            reject (err)

    @delete = (Gym) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Gyms/" + Gym.id
          .then (Gym) ->
            resolve Gym.data
          .catch (err) ->
            reject (err)

    return this
]
