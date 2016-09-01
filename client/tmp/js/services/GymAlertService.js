module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/GymAlerts", {
          params: searchParams
        }).then(function(GymAlerts) {
          return resolve(GymAlerts.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/GymAlerts/" + id).then(function(GymAlert) {
          return resolve(GymAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(GymAlert) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/GymAlerts", GymAlert).then(function(alert) {
          return resolve(alert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(GymAlert) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/GymAlerts/") + GymAlert.id, GymAlert).then(function(GymAlert) {
          return resolve(GymAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(GymAlert) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/GymAlerts/") + GymAlert.id).then(function(GymAlert) {
          return resolve(GymAlert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
