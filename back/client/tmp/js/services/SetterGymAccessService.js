module.exports = [
  '$http', '$q', 'BASE_URL', function($http, $q, BASE_URL) {
    this.find = function(searchParams) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/SetterGymAccesss", {
          params: searchParams
        }).then(function(SetterGymAccesss) {
          return resolve(SetterGymAccesss.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.get = function(id) {
      return $q(function(resolve, reject) {
        return $http.get(BASE_URL + "/SetterGymAccesss/" + id).then(function(SetterGymAccess) {
          return resolve(SetterGymAccess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.create = function(SetterGymAccess) {
      return $q(function(resolve, reject) {
        return $http.post(BASE_URL + "/SetterGymAccesss", SetterGymAccess).then(function(SetterGymAccess) {
          return resolve(SetterGymAccess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this.update = function(SetterGymAccess) {
      return $q(function(resolve, reject) {
        return $http.put((BASE_URL + "/SetterGymAccesss/") + SetterGymAccess.id, SetterGymAccess).then(function(SetterGymAccess) {
          return resolve(SetterGymAccess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    this["delete"] = function(SetterGymAccess) {
      return $q(function(resolve, reject) {
        return $http["delete"]((BASE_URL + "/SetterGymAccesss/") + SetterGymAccess.id).then(function(SetterGymAccess) {
          return resolve(SetterGymAccess.data);
        })["catch"](function(err) {
          return reject(err);
        });
      });
    };
    return this;
  }
];
