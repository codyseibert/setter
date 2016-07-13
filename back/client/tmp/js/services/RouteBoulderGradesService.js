module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteBoulderGradess", {
          params: searchParams
        }).then(function(RouteBoulderGradess) {
          return resolve(RouteBoulderGradess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RouteBoulderGradess/" + id).then(function(RouteBoulderGrades) {
          return resolve(RouteBoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RouteBoulderGrades) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RouteBoulderGradess", RouteBoulderGrades).then(function(RouteBoulderGrades) {
          return resolve(RouteBoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RouteBoulderGrades) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RouteBoulderGradess/") + RouteBoulderGrades.id, RouteBoulderGrades).then(function(RouteBoulderGrades) {
          return resolve(RouteBoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RouteBoulderGrades) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RouteBoulderGradess/") + RouteBoulderGrades.id).then(function(RouteBoulderGrades) {
          return resolve(RouteBoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
