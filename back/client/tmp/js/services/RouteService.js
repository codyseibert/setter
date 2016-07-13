module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Routes", {
          params: searchParams
        }).then(function(Routes) {
          return resolve(Routes.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Routes/" + id).then(function(Route) {
          return resolve(Route.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Route) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Routes", Route).then(function(Route) {
          return resolve(Route.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Route) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Routes/") + Route.id, Route).then(function(Route) {
          return resolve(Route.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Route) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Routes/") + Route.id).then(function(Route) {
          return resolve(Route.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
