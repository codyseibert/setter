module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/BoulderGradess", {
          params: searchParams
        }).then(function(BoulderGradess) {
          return resolve(BoulderGradess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/BoulderGradess/" + id).then(function(BoulderGrades) {
          return resolve(BoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(BoulderGrades) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/BoulderGradess", BoulderGrades).then(function(BoulderGrades) {
          return resolve(BoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(BoulderGrades) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/BoulderGradess/") + BoulderGrades.id, BoulderGrades).then(function(BoulderGrades) {
          return resolve(BoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(BoulderGrades) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/BoulderGradess/") + BoulderGrades.id).then(function(BoulderGrades) {
          return resolve(BoulderGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
