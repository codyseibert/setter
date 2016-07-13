module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Alerts", {
          params: searchParams
        }).then(function(Alerts) {
          return resolve(Alerts.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/Alerts/" + id).then(function(Alert) {
          return resolve(Alert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(Alert) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/Alerts", Alert).then(function(Alert) {
          return resolve(Alert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(Alert) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/Alerts/") + Alert.id, Alert).then(function(Alert) {
          return resolve(Alert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(Alert) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/Alerts/") + Alert.id).then(function(Alert) {
          return resolve(Alert.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
