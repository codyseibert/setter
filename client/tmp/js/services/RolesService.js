module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Roless", {
          params: searchParams
        }).then(function(Roless) {
          return resolve(Roless.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Roless/" + id).then(function(Roles) {
          return resolve(Roles.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Roles) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Roless", Roles).then(function(Roles) {
          return resolve(Roles.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Roles) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Roless/") + Roles.id, Roles).then(function(Roles) {
          return resolve(Roles.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Roles) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Roless/") + Roles.id).then(function(Roles) {
          return resolve(Roles.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
