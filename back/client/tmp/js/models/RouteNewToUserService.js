module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteNewToUsers", {
          params: searchParams
        }).then(function(RouteNewToUsers) {
          return resolve(RouteNewToUsers.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteNewToUsers/" + id).then(function(RouteNewToUser) {
          return resolve(RouteNewToUser.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteNewToUser) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteNewToUsers", RouteNewToUser).then(function(RouteNewToUser) {
          return resolve(RouteNewToUser.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteNewToUser) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteNewToUsers/") + RouteNewToUser.id, RouteNewToUser).then(function(RouteNewToUser) {
          return resolve(RouteNewToUser.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteNewToUser) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteNewToUsers/") + RouteNewToUser.id).then(function(RouteNewToUser) {
          return resolve(RouteNewToUser.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
