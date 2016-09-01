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
        $http.get "#{BASE_URL}/Accounts", params: searchParams
          .then (Accounts) ->
            resolve Accounts.data
          .catch (err) ->
            reject (err)

    @get = (id) ->
      $q (resolve, reject) ->
        $http.get "#{BASE_URL}/Accounts/#{id}"
          .then (Account) ->
            resolve Account.data
          .catch (err) ->
            reject (err)

    @create = (Account) ->
      $q (resolve, reject) ->
        $http.post "#{BASE_URL}/Accounts", Account
          .then (Account) ->
            resolve Account.data
          .catch (err) ->
            reject (err)

    @update = (Account) ->
      $q (resolve, reject) ->
        $http.put "#{BASE_URL}/Accounts/" + Account.id, Account
          .then (Account) ->
            resolve Account.data
          .catch (err) ->
            reject (err)

    @delete = (Account) ->
      $q (resolve, reject) ->
        $http.delete "#{BASE_URL}/Accounts/" + Account.id
          .then (Account) ->
            resolve Account.data
          .catch (err) ->
            reject (err)

    return this
]
