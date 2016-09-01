module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RopeGradess", {
          params: searchParams
        }).then(function(RopeGradess) {
          return resolve(RopeGradess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/RopeGradess/" + id).then(function(RopeGrades) {
          return resolve(RopeGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(RopeGrades) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/RopeGradess", RopeGrades).then(function(RopeGrades) {
          return resolve(RopeGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(RopeGrades) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/RopeGradess/") + RopeGrades.id, RopeGrades).then(function(RopeGrades) {
          return resolve(RopeGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(RopeGrades) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/RopeGradess/") + RopeGrades.id).then(function(RopeGrades) {
          return resolve(RopeGrades.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
