module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteSends", {
          params: searchParams
        }).then(function(RouteSends) {
          return resolve(RouteSends.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteSends/" + id).then(function(RouteSend) {
          return resolve(RouteSend.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteSend) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteSends", RouteSend).then(function(RouteSend) {
          return resolve(RouteSend.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteSend) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteSends/") + RouteSend.id, RouteSend).then(function(RouteSend) {
          return resolve(RouteSend.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteSend) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteSends/") + RouteSend.id).then(function(RouteSend) {
          return resolve(RouteSend.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
