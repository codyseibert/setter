module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteComments", {
          params: searchParams
        }).then(function(RouteComments) {
          return resolve(RouteComments.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteComments/" + id).then(function(RouteComment) {
          return resolve(RouteComment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteComment) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteComments", RouteComment).then(function(RouteComment) {
          return resolve(RouteComment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteComment) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteComments/") + RouteComment.id, RouteComment).then(function(RouteComment) {
          return resolve(RouteComment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteComment) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteComments/") + RouteComment.id).then(function(RouteComment) {
          return resolve(RouteComment.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
