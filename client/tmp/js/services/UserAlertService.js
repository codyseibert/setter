module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/UserAlerts", {
          params: searchParams
        }).then(function(UserAlerts) {
          return resolve(UserAlerts.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/UserAlerts/" + id).then(function(UserAlert) {
          return resolve(UserAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(UserAlert) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/UserAlerts", UserAlert).then(function(UserAlert) {
          return resolve(UserAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(UserAlert) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/UserAlerts/") + UserAlert.id, UserAlert).then(function(UserAlert) {
          return resolve(UserAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(UserAlert) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/UserAlerts/") + UserAlert.id).then(function(UserAlert) {
          return resolve(UserAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
