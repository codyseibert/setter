module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Walls", {
          params: searchParams
        }).then(function(Walls) {
          return resolve(Walls.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Walls/" + id).then(function(Wall) {
          return resolve(Wall.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Wall) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Walls", Wall).then(function(Wall) {
          return resolve(Wall.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Wall) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Walls/") + Wall.id, Wall).then(function(Wall) {
          return resolve(Wall.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Wall) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Walls/") + Wall.id).then(function(Wall) {
          return resolve(Wall.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
