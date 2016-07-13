module.exports = [
  '$http', '$q', 'BASE_URL', 'Upload', function($http, $q, BASE_URL, Upload) {
    return {
      upload: function(file) {
        return $q(function(resolve, reject) {
          return Upload.upload({
            url: BASE_URL + '/File',
            file: file
          }).then(function(res) {
            return resolve(res.data);
          })["catch"](function(err) {
            return reject(err);
          });
        });
      }
    };
  }
];
