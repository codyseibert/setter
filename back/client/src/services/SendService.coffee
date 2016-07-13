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
        $http.get "#{BASE_URL}/Sends", params: searchParams
          .then (Sends) ->
            resolve Sends.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Sends/#{id}"
          .then (Send) ->
            resolve Send.data
          .catch (err) ->
            reject (err)

    @create = (Send) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Sends", Send
          .then (Send) ->
            resolve Send.data
          .catch (err) ->
            reject (err)

    @update = (Send) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Sends/" + Send.id, Send
          .then (Send) ->
            resolve Send.data
          .catch (err) ->
            reject (err)

    @delete = (Send) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Sends/" + Send.id
          .then (Send) ->
            resolve Send.data
          .catch (err) ->
            reject (err)

    return this
]
