module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Sends", {
          params: searchParams
        }).then(function(Sends) {
          return resolve(Sends.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Sends/" + id).then(function(Send) {
          return resolve(Send.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Send) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Sends", Send).then(function(Send) {
          return resolve(Send.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Send) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Sends/") + Send.id, Send).then(function(Send) {
          return resolve(Send.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Send) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Sends/") + Send.id).then(function(Send) {
          return resolve(Send.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
