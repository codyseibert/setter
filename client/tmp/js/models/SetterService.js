module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Setters", {
          params: searchParams
        }).then(function(Setters) {
          return resolve(Setters.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Setters/" + id).then(function(Setter) {
          return resolve(Setter.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Setter) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Setters", Setter).then(function(Setter) {
          return resolve(Setter.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Setter) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Setters/") + Setter.id, Setter).then(function(Setter) {
          return resolve(Setter.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Setter) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Setters/") + Setter.id).then(function(Setter) {
          return resolve(Setter.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
