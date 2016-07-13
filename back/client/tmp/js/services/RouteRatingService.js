module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteRatings", {
          params: searchParams
        }).then(function(RouteRatings) {
          return resolve(RouteRatings.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteRatings/" + id).then(function(RouteRating) {
          return resolve(RouteRating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteRating) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteRatings", RouteRating).then(function(RouteRating) {
          return resolve(RouteRating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteRating) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteRatings/") + RouteRating.id, RouteRating).then(function(RouteRating) {
          return resolve(RouteRating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteRating) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteRatings/") + RouteRating.id).then(function(RouteRating) {
          return resolve(RouteRating.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
