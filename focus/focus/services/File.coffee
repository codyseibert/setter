module.exports = [
  '$http'
  '$q'
  'BASE_URL'
  'Upload'
  (
    $http
    $q
    BASE_URL
    Upload
  ) ->

    upload: (file) ->
      $q (resolve, reject) ->
        Upload.upload(
          url: BASE_URL + '/File'
          file: file
        )
        .then (res) ->
          resolve res.data
        .catch (err) ->
          reject err
]
