module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/News", {
          params: searchParams
        }).then(function(Gyms) {
          return resolve(Gyms.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/News/" + id).then(function(Gym) {
          return resolve(Gym.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Gym) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/News", Gym).then(function(Gym) {
          return resolve(Gym.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Gym) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/News/") + Gym.id, Gym).then(function(Gym) {
          return resolve(Gym.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Gym) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/News/") + Gym.id).then(function(Gym) {
          return resolve(Gym.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
