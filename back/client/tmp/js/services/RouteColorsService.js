module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteColorss", {
          params: searchParams
        }).then(function(RouteColorss) {
          return resolve(RouteColorss.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteColorss/" + id).then(function(RouteColors) {
          return resolve(RouteColors.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteColors) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteColorss", RouteColors).then(function(RouteColors) {
          return resolve(RouteColors.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteColors) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteColorss/") + RouteColors.id, RouteColors).then(function(RouteColors) {
          return resolve(RouteColors.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteColors) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteColorss/") + RouteColors.id).then(function(RouteColors) {
          return resolve(RouteColors.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
