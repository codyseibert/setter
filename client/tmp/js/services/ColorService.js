module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Colors", {
          params: searchParams
        }).then(function(Colors) {
          return resolve(Colors.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Colors/" + id).then(function(Color) {
          return resolve(Color.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Color) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Colors", Color).then(function(Color) {
          return resolve(Color.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Color) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Colors/") + Color.id, Color).then(function(Color) {
          return resolve(Color.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Color) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Colors/") + Color.id).then(function(Color) {
          return resolve(Color.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
