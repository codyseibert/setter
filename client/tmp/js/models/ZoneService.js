module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Zones", {
          params: searchParams
        }).then(function(Zones) {
          return resolve(Zones.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Zones/" + id).then(function(Zone) {
          return resolve(Zone.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Zone) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Zones", Zone).then(function(Zone) {
          return resolve(Zone.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Zone) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Zones/") + Zone.id, Zone).then(function(Zone) {
          return resolve(Zone.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Zone) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Zones/") + Zone.id).then(function(Zone) {
          return resolve(Zone.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
